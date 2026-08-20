- https://developer.arm.com/community/arm-community-blogs/b/mobile-graphics-and-gaming-blog/posts/vulkan-subpasses-the-good-the-bad-and-the-ugly

`subpass` tile base rendering 向け？

# `1.4 obsoleted` vkCmdBeginRenderPass

https://docs.vulkan.org/refpages/latest/refpages/source/vkCmdBeginRenderPass.html

```c
// Provided by VK_VERSION_1_0
typedef struct VkRenderPassBeginInfo {
    VkStructureType        sType;
    const void*            pNext;

    VkRenderPass           renderPass; // RenderPass に対して
    VkFramebuffer          framebuffer; // FrameBuffer を結び付ける

    VkRect2D               renderArea;
    uint32_t               clearValueCount;
    const VkClearValue*    pClearValues;
} VkRenderPassBeginInfo;

// Provided by VK_VERSION_1_0
void vkCmdBeginRenderPass(
    VkCommandBuffer                             commandBuffer,
    const VkRenderPassBeginInfo*                pRenderPassBegin,
    VkSubpassContents                           contents);
```

RenderPass が定義(AttachmentDescription)で、FrameBuffer が実体(ImageView)

```c
// Provided by VK_VERSION_1_0
typedef struct VkRenderPassCreateInfo {
    VkStructureType                   sType;
    const void*                       pNext;
    VkRenderPassCreateFlags           flags;

    uint32_t                          attachmentCount;
    const VkAttachmentDescription*    pAttachments;

    uint32_t                          subpassCount;
    const VkSubpassDescription*       pSubpasses;

    uint32_t                          dependencyCount;
    const VkSubpassDependency*        pDependencies;
} VkRenderPassCreateInfo;
```

```c
// Provided by VK_VERSION_1_0
typedef struct VkFramebufferCreateInfo {
    VkStructureType             sType;
    const void*                 pNext;
    VkFramebufferCreateFlags    flags;
    VkRenderPass                renderPass;

    uint32_t                    attachmentCount;
    const VkImageView*          pAttachments;

    uint32_t                    width;
    uint32_t                    height;
    uint32_t                    layers;
} VkFramebufferCreateInfo;
```

# `vulkan-1.3` vkCmdBeginRendering

- https://www.reddit.com/r/vulkan/comments/1lusfib/dynamic_rendering_vs_render_passes_what_to_choose/?tl=ja

`FrameBuffer` が不要になる !

