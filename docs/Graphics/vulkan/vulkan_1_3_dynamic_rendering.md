https://docs.vulkan.org/samples/latest/samples/extensions/dynamic_rendering/README.html

`RenderPass` に依存せずに Pipeline 描画できる？
`ViewportState` の `VK_DYNAMIC_STATE_VIEWPORT` や `VK_DYNAMIC_STATE_SCISSOR` と組み合わせる。

https://docs.vulkan.org/guide/latest/dynamic_state.html

```c
VkRenderPassBeginInfo render_pass_begin_info    = vkb::initializers::render_pass_begin_info();
render_pass_begin_info.renderPass               = render_pass;
render_pass_begin_info.framebuffer              = framebuffers[i];
render_pass_begin_info.renderArea.extent.width  = width;
render_pass_begin_info.renderArea.extent.height = height;
render_pass_begin_info.clearValueCount          = 3;
render_pass_begin_info.pClearValues             = clear_values.data();

vkCmdBeginRenderPass(draw_cmd_buffer, &render_pass_begin_info, VK_SUBPASS_CONTENTS_INLINE);

draw_scene();

vkCmdEndRenderPass(draw_cmd_buffer);
```

# 初期化

## Instance

## Feature



