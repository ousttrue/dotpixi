# pipelien stage

- some stages can be merged

# vkCmdPipelineBarrier

- https://docs.vulkan.org/samples/latest/samples/performance/pipeline_barriers/README.html
- [Vulkan pipeline synchronization](https://developer.arm.com/documentation/101897/0304/Optimizing-application-logic/Vulkan-pipeline-synchronization)

- HOST_BIT
- ALL_GRAPHICS_BIT
- ALL_COMMANDS_BIT

## pipelin stage

- @2016 https://gpuopen.com/learn/vulkan-barriers-explained/

```c
vkCmdPipelineBarrier(
    commandBuffer,
    VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT, // source stage
    VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,    // destination stage
    /* remaining parameters omitted */);
```

## VK_IMAGE_LAYOUT_x



## Vertex or compute hardware slot

- VK_PIPELINE_STAGE_DRAW_INDIRECT_BIT
- VK_PIPELINE_STAGE_VERTEX_X_BIT
- VK_PIPELINE_STAGE_TESSELLATION_X_BIT
- VK_PIPELINE_STAGE_GEOMETRY_SHADER_BIT
- VK_PIPELINE_STAGE_COMPUTE_SHADER_BIT
- VK_PIPELINE_STAGE_TRANSFER_BIT

## Fragment hardware slot

- VK_PIPELINE_STAGE_EARLY_FRAGMENT_TESTS_BIT
- VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT
- VK_PIPELINE_STAGE_LATE_FRAGMENT_TESTS_BIT
- VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT
- VK_PIPELINE_STAGE_TRANSFER_BIT

# VkBufferMemoryBarrier

# VkImageMemoryBarrier
