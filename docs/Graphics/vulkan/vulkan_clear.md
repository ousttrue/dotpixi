https://www.khronos.org/assets/uploads/developers/presentations/Ensure_Vulkan_Synchronization_Vulkanised_Oct_2021.pdf

```cpp
vkCmdCopyBuffer(cb, buffer_a, buffer_b, 1, &region); /* a is copy src */
vkCmdCopyBuffer(cb, buffer_c, buffer_a, 1, &region); /* a is copy dst */

// 👇

vkCmdCopyBuffer(cb, buffer_a, buffer_b, 1, &region);
vkCmdPipelineBarrier(
    cb, VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT,
    0, 0, nullptr, 0, nullptr, 0,nullptr);
vkCmdCopyBuffer(cb, buffer_c, buffer_a, 1, &region);
```

# VkImageMemoryBarrier

https://registry.khronos.org/vulkan/specs/latest/man/html/VkImageMemoryBarrier.html

# vkCmdPipelineBarrier

https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier.html

```cpp
// Provided by VK_VERSION_1_0
void vkCmdPipelineBarrier(
    VkCommandBuffer                             commandBuffer,
    VkPipelineStageFlags                        srcStageMask,
    VkPipelineStageFlags                        dstStageMask,
    VkDependencyFlags                           dependencyFlags,
    // state 変更を記述
    uint32_t                                    memoryBarrierCount,
    const VkMemoryBarrier*                      pMemoryBarriers,
    // state 変更を記述
    uint32_t                                    bufferMemoryBarrierCount,
    const VkBufferMemoryBarrier*                pBufferMemoryBarriers,
    // state 変更を記述
    uint32_t                                    imageMemoryBarrierCount,
    const VkImageMemoryBarrier*                 pImageMemoryBarriers);
```

https://registry.khronos.org/vulkan/specs/latest/man/html/VkImageSubresourceRange.html

```cpp
// Provided by VK_VERSION_1_0
typedef struct VkImageSubresourceRange {
    VkImageAspectFlags    aspectMask =VK_IMAGE_ASPECT_COLOR_BIT;
    uint32_t              baseMipLevel =0;
    uint32_t              levelCount=1;
    uint32_t              baseArrayLayer =0;
    uint32_t              layerCount=1;
} VkImageSubresourceRange;
```

# vkCmdCopyBufferToImage

https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html

```cpp
vkCmdPipelineBarrier(commandBuffer,
                     VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT, 0,
                     // memory, buffer
                     0, nullptr, 0, nullptr,
                     // image
                     1, &VkImageMemoryBarrier{
                        .srcAccessMask = 0;
                        .dstAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT, // 👈
                        .oldLayout = VK_IMAGE_LAYOUT_UNDEFINED, // discard content
                        .newLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, // 👈
                        .srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED,
                        .dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED,
                        .image = image,
                        .subresourceRange = subResourceRange
                     });

vkCmdCopyBufferToImage(commandBuffer, buffer, image,
                       VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
                       1, &subResourceRange);
```

# vkCmdClearColorImage

https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html

- https://gist.github.com/TheServer201/26c280d0779423dc714da4a299636ff7

```cpp
vkCmdPipelineBarrier(commandBuffer,
                     VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT, 0,
                     // memory, buffer
                     0, nullptr, 0, nullptr,
                     // image
                     1, &VkImageMemoryBarrier{
                        .srcAccessMask = VK_ACCESS_MEMORY_READ_BIT,
                        .dstAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT, // 👈
                        .oldLayout = VK_IMAGE_LAYOUT_UNDEFINED, // discard content
                        .newLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, // 👈
                        .srcQueueFamilyIndex = queue_family_index,
                        .dstQueueFamilyIndex = queue_family_index,
                        .image = image,
                        .subresourceRange = subResourceRange,
                     });

vkCmdClearColorImage(commandBuffer, image,
                     VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, &clearColorValue,
                     1, &subResourceRange);
```

# vkCmdBlitImage

# attach の前

```cpp
vkCmdPipelineBarrier(commandBuffer,
                     VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, 0,
                     // memory, buffer
                     0, nullptr, 0, nullptr,
                     // image
                     1, &VkImageMemoryBarrier{
                        .srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
                        .dstAccessMask = VK_ACCESS_SHADER_READ_BIT; // 👈
                        .oldLayout = VK_IMAGE_LAYOUT_UNDEFINED,
                        .newLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, // 👈
                        .srcQueueFamilyIndex = queue_family_index,
                        .dstQueueFamilyIndex = queue_family_index,
                        .image = image,
                        .subresourceRange = subResourceRange,
                     });
```

# present の前

```cpp
vkCmdPipelineBarrier(commandBuffer,
                     VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT, 0,
                     // memory, buffer
                     0, nullptr, 0, nullptr,
                     // image
                     1, &VkImageMemoryBarrier{
                        .srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT,
                        .dstAccessMask = VK_ACCESS_MEMORY_READ_BIT, // 👈
                        .oldLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
                        .newLayout = VK_IMAGE_LAYOUT_PRESENT_SRC_KHR, // 👈
                        .srcQueueFamilyIndex = queue_family_index,
                        .dstQueueFamilyIndex = queue_family_index,
                        .image = image,
                        .subresourceRange = subResourceRange,
                     });
```
