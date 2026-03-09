https://gitlab.freedesktop.org/wlroots/wlroots/-/tree/master/render/gles2?ref_type=heads

- https://drewdevault.com/2018/02/28/Writing-a-wayland-compositor-part-3.html

# 3D ?

https://github.com/zwin-project/zwin

# wlr_render_pass

https://kennylevinsen.pages.freedesktop.org/wlroots/wlr/render/pass.h.html

# wlr_renderer_impl

```c
static const struct wlr_render_pass_impl render_pass_impl = {
	.submit = render_pass_submit,
    // set_proj_matrix
	.add_texture = render_pass_add_texture,
    // set_proj_matrix
	.add_rect = render_pass_add_rect,
};

struct wlr_gles2_render_pass {
	struct wlr_render_pass base;
	struct wlr_gles2_buffer *buffer;
	float projection_matrix[9];
	struct wlr_egl_context prev_ctx;
	struct wlr_gles2_render_timer *timer;
	struct wlr_drm_syncobj_timeline *signal_timeline;
	uint64_t signal_point;
};

struct wl_resource {
	struct wl_object object;
	void (*destroy)(struct wl_resource *resource);
	struct wl_list link;
	struct wl_signal destroy_signal;
	struct wl_client *client;
	void *data;
};

struct wl_buffer {
	struct wl_resource resource;
	int32_t width, height;
	uint32_t busy_count;
};

struct wlr_renderer_impl {
	const struct wlr_drm_format_set *(*get_texture_formats)(​struct wlr_renderer *renderer, uint32_t buffer_caps);
	const struct wlr_drm_format_set *(*get_render_formats)(​struct wlr_renderer *renderer);
	void (*destroy)(​struct wlr_renderer *renderer);
	int (*get_drm_fd)(​struct wlr_renderer *renderer);
	struct wlr_texture *(*texture_from_buffer)(​struct wlr_renderer *renderer, struct wlr_buffer *buffer);
    // renderer
	struct wlr_render_pass *(*begin_buffer_pass)(​struct wlr_renderer *renderer, struct wlr_buffer *buffer, const struct wlr_buffer_pass_options *options);
	struct wlr_render_timer *(*render_timer_create)(​struct wlr_renderer *renderer);
};

void wlr_renderer_init(​struct wlr_renderer *renderer, const struct wlr_renderer_impl *impl, uint32_t render_buffer_caps);
```

# awesome

https://github.com/rcalixte/awesome-wayland?tab=readme-ov-file#compositors

| url                                   | projection | wlr_renderer_init    |     |
| ------------------------------------- | ---------- | -------------------- | --- |
| render/gles2                          | mat3       | o                    |
| https://github.com/wlx-team/wayvr     | rust ?     |
| https://github.com/zwin-project/zen   |            | o                    |
| https://git.sr.ht/~bl4ckb0ne/wxrc     | mat3 ?     | no custom renderer ? |
| https://github.com/wlrfx/scenefx      | mat3       |
| https://github.com/DiogenesN/woodland |            |
