import argparse
import pathlib
import os
import shutil

HERE = pathlib.Path(__file__).absolute().parent
PROJECT_ROOT = HERE.parent.parent
SYNC_DIR = PROJECT_ROOT / "sync"


HOME = pathlib.Path(os.environ.get("HOME"))


def add_link(src: pathlib.Path, dst: pathlib.Path):
    print(f"{src} => {dst}")
    if not dst.parent.exists():
        dst.parent.mkdir(parents=True)
    if dst.exists():
        dst.unlink()
    shutil.move(src, dst)
    src.symlink_to(dst)


def get_xdg_config_home():
    val = os.environ.get("XDG_CONFIG_HOME")
    if val:
        return pathlib.Path(val)
    else:
        return HOME / ".config"


XDG_CONFIG_HOME = get_xdg_config_home()


def make_links(force=False):
    for root, dirs, files in os.walk(SYNC_DIR):
        root_path = pathlib.Path(root)
        for file in files:
            dst = root_path / file
            rel = dst.relative_to(SYNC_DIR)
            src = HOME / str(rel)
            src.parent.mkdir(parents=True, exist_ok=True)
            if src.exists():
                if not force:
                    print(f"skip {rel}")
                    continue
                src.unlink()

            src.symlink_to(dst)
            print(f"link {rel}")


def remove_deadlinks():
    pass


def command_sync():
    make_links()
    remove_deadlinks()


def command_add(src: pathlib.Path, force=False):
    src = src.absolute()
    assert src.exists(), f"no such file: {src}"
    rel = src.relative_to(HOME)
    dst = SYNC_DIR / str(rel)

    if src.is_dir() and src.parent == XDG_CONFIG_HOME:
        if dst.exists() and not force:
            print(f"{dst} already exists")
            return
        print("XDG_CONFIG_HOME", src.name)
        if not dst.parent.exists():
            dst.parent.mkdir(parents=True)
        shutil.move(src, dst)
        make_links()

    elif src.is_file():
        add_link(src, dst)

    else:
        raise Exception(f"is not normal file: {src}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog="dotpixi",
        description="dot file utility",
    )
    subparsers = parser.add_subparsers(dest="subcmd_name")

    parser_add = subparsers.add_parser(
        "add", help="mv a dotfile to under `sync` and symlink"
    )
    parser_add.add_argument("path", type=pathlib.Path, help="path to dotfile")

    parser_sync = subparsers.add_parser("sync", help="make symlink and remove deadlink")
    # --force

    # TODO:
    # orphan

    args = parser.parse_args()
    if args.subcmd_name == "add":
        command_add(args.path)
    elif args.subcmd_name == "sync":
        command_sync()
    else:
        parser.print_help()
