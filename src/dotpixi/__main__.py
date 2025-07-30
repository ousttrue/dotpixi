import argparse
import pathlib
import os
import shutil
import logging

LOGGER = logging.getLogger(__name__)


mapping = {
    "TRACE": "",
    # cyan
    "DEBUG": "\x1b[36m",
    # green
    "INFO": "\x1b[32m",
    # yellow
    "WARNING": "\x1b[33m",
    "WARN": "\x1b[33m",
    # red
    "ERROR": "\x1b[31m",
    "ALERT": "\x1b[37;41m",
    "CRITICAL": "\x1b[37;41m",
}


class ColorFormatter(logging.Formatter):
    def format(self, record: logging.LogRecord) -> str:
        begin_color = mapping[record.levelname]
        end_color = "\x1b[0m"
        return begin_color + super().format(record) + end_color


# class ColorfulHandler(logging.StreamHandler):
#     def emit(self, record: logging.LogRecord) -> None:
#         record.levelname = mapping[record.levelname]
#         super().emit(record)


HERE = pathlib.Path(__file__).absolute().parent
PROJECT_ROOT = HERE.parent.parent
SYNC_DIR = PROJECT_ROOT / "sync"


HOME = pathlib.Path(os.environ.get("HOME") or os.environ.get("USERPROFILE"))


def get_xdg_config_home():
    val = os.environ.get("XDG_CONFIG_HOME")
    if val:
        return pathlib.Path(val)
    else:
        return HOME / ".config"


XDG_CONFIG_HOME = get_xdg_config_home()


def make_a_link(sync: pathlib.Path, target: pathlib.Path, force=False):
    assert not sync.is_symlink(), f"{sync} is_symlink"
    target.parent.mkdir(parents=True, exist_ok=True)
    if target.exists(follow_symlinks=False):
        if not force:
            LOGGER.debug(
                f"skip {sync.relative_to(SYNC_DIR)} => {target.relative_to(HOME)}"
            )
            return
        target.unlink()

    target.symlink_to(sync)
    LOGGER.info(f"link {sync.relative_to(SYNC_DIR)} => {target.relative_to(HOME)}")


def make_xdg_config(dir: pathlib.Path, force=False):
    assert dir.is_dir()

    target_dir = XDG_CONFIG_HOME / dir.name
    # if dir.name == "yazi" and os.name == "nt":
    #     APPDATA = pathlib.Path(os.environ.get("APPDATA"))
    #     target_dir = APPDATA / "yazi/config"

    LOGGER.warning(
        f"make_xdg_config {dir.relative_to(SYNC_DIR)} => {target_dir.relative_to(HOME)}"
    )

    for root, dirs, files in os.walk(dir):
        root_dir = pathlib.Path(root)
        for file in files:
            sync = root_dir / file
            assert not sync.is_symlink(), f"{sync} is_symlink"
            rel = sync.relative_to(dir)
            target = target_dir / rel
            make_a_link(sync, target, force)


def make_links(sync: pathlib.Path, force=False):
    assert sync.is_dir()

    if sync.parent == SYNC_DIR / ".config":
        make_xdg_config(sync)
    else:
        for child in sync.iterdir():
            if child.is_file():
                rel = child.relative_to(SYNC_DIR)
                target = HOME / str(rel)
                make_a_link(child, target, force)
            elif child.is_dir():
                make_links(child, force)


def remove_deadlinks(dir):
    for target in dir.iterdir():
        if target.is_symlink():
            src = target.readlink()
            if not src.exists():
                LOGGER.error(f"deadlink {target.relative_to(HOME)} => {src}")
                target.unlink()
        elif target.is_dir():
            if dir == HOME:
                if target.name == ".config":
                    remove_deadlinks(target)
                else:
                    LOGGER.debug(f"skip {target}")
            else:
                remove_deadlinks(target)


def command_sync(force=False):
    make_links(SYNC_DIR, force)
    remove_deadlinks(HOME)


def command_add(src: pathlib.Path, force=False):
    src = src.absolute()
    assert src.exists(), f"no such file: {src}"
    rel = src.relative_to(HOME)
    dst = SYNC_DIR / str(rel)

    if src.is_dir() and src.parent == XDG_CONFIG_HOME:
        if dst.exists() and not force:
            LOGGER.info(f"{dst} already exists")
            return
        LOGGER.info(f"XDG_CONFIG_HOME: {src.name}")
        if not dst.parent.exists():
            dst.parent.mkdir(parents=True)
        shutil.move(src, dst)
        make_links()

    elif src.is_file():
        if not dst.parent.exists():
            dst.parent.mkdir(parents=True)
        if dst.exists():
            if not force:
                LOGGER.warning(f"already exists: {dst.relative_to(SYNC_DIR)}")
                return
            dst.unlink()
        shutil.move(src, dst)
        make_a_link(dst, src, force)

    else:
        raise Exception(f"is not normal file: {src}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="dotpixi",
        description="dot file utility",
    )
    parser.add_argument("--verbose", action="store_true")
    subparsers = parser.add_subparsers(dest="subcmd_name")

    parser_add = subparsers.add_parser(
        "add", help="mv a dotfile to under `sync` and symlink"
    )
    parser_add.add_argument("path", type=pathlib.Path, help="path to dotfile")

    parser_sync = subparsers.add_parser("sync", help="make symlink and remove deadlink")
    parser_sync.add_argument("--force", action="store_true")

    # TODO:
    # orphan

    args = parser.parse_args()

    logging.basicConfig(
        # format="%(asctime)s %(user)-8s %(message)s",
        level=logging.DEBUG if args.verbose else logging.INFO,
    )
    f = ColorFormatter()
    for h in logging.getLogger().handlers:
        h.setFormatter(f)

    if args.subcmd_name == "add":
        command_add(args.path)
    elif args.subcmd_name == "sync":
        command_sync(args.force)
    else:
        parser.print_help()
