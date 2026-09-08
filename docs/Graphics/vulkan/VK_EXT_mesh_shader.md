https://www.khronos.org/assets/uploads/developers/presentations/how-to-use-mesh-shaders.pdf
https://github.com/KhronosGroup/Vulkan-Docs/blob/main/proposals/VK_EXT_mesh_shader.adoc

- @2022 [Mesh Shading for Vulkan](https://www.khronos.org/blog/mesh-shading-for-vulkan)
- @2022 [西川善司の3DGE：Primitive Shader対Mesh Shaderの真実。ジオメトリパイプライン戦争の内幕とAMDのゲーマー向けGPU戦略](https://www.4gamer.net/games/660/G066019/20230213083/)
- [ソフトウェアラスタライザ - Speaker Deck](https://speakerdeck.com/fadis/e7b18abb-89e7-44d2-9075-256faf24bdf8)
- https://chaoticbob.github.io/2024/01/24/mesh-shading-part-1.html

# shader

前半を compute shader にして、後半を rasterizer に出力する感じ？

`vertex shader => fragment shader`

が

`mesh shader => fragment shader`

もしくは

`task shader => mesh shader => fragment shader` になる。

## mesh shader

- https://anki3d.org/workarounds-for-issues-with-mesh-shaders-vulkan-hlsl/

- output Vertex
- output Primitive(new!)

```glsl
#version 450

// 拡張機能を有効化する
#extension GL_EXT_mesh_shader : require

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

// 出力プリミティブを三角形に設定する
// linesやpointsに設定することもできる
// 出力する頂点数と三角形の数も設定する
// 1枚の四角ポリゴンをtriangulateするため4つの頂点と2つ三角形を出力する
layout(triangles, max_vertices = 4, max_primitives = 2) out;

// Vertex shaderと異なり頂点情報もただのバッファとして入力される
layout(binding = 0) buffer Vertices{vec4 v[];} vertices;
layout(binding = 1) buffer Indices{uint i[];} indices;

// 頂点ごとに出力したい情報
layout(location = 0) out VertexOutput
{
    vec4 color;
} vertexOutput[];

void main()
{
    // CPU側からは
    // vkCmdDrawMeshTasksEXT(cmdBuf, groupCountX, groupCountY, groupCountZ)
    // という形で実行される
    uint primitiveID = gl_GlobalInvocationID.x;

    uint i0 = indices.i[4 * primitiveID + 0]; 
    uint i1 = indices.i[4 * primitiveID + 1]; 
    uint i2 = indices.i[4 * primitiveID + 2];
    uint i3 = indices.i[4 * primitiveID + 3];
    
    vec4 v0 = vec4(vertices.v[i0]);
    vec4 v1 = vec4(vertices.v[i1]);
    vec4 v2 = vec4(vertices.v[i2]);
    vec4 v3 = vec4(vertices.v[i3]);
    
    // 出力する頂点数(4)とプリミティブ数(2)を設定
    SetMeshOutputsEXT(4, 2);
    
    // gl_MeshPerVertexEXTの中身を設定していく
    gl_MeshVerticesEXT[0].gl_Position = v0;
    gl_MeshVerticesEXT[1].gl_Position = v1;
    gl_MeshVerticesEXT[2].gl_Position = v2;

    gl_MeshVerticesEXT[3].gl_Position = v3;
    
    vertexOutput[0].color = vec4(1.0, 0.0, 0.0, 1.0);
    vertexOutput[1].color = vec4(0.0, 1.0, 0.0, 1.0);
    vertexOutput[2].color = vec4(0.0, 0.0, 1.0, 1.0);
    vertexOutput[3].color = vec4(0.0, 1.0, 0.0, 1.0);
    
    // 2つのプリミティブ(三角形)のインデックスを設定する
    gl_PrimitiveTriangleIndicesEXT[2*gl_LocalInvocationIndex + 0] =  uvec3(0, 1, 2);
    gl_PrimitiveTriangleIndicesEXT[2*gl_LocalInvocationIndex + 1] =  uvec3(2, 3, 0);
}
```

## vkCmdDrawMeshTasksEXT



## task shader(amplification shader) => mesh shader

# tutorial

- [はじめてのメッシュシェーダ](https://www.project-asura.com/old/d3d12/d3d12_008.html)

# OpenGL

- https://www.geeks3d.com/20200519/introduction-to-mesh-shaders-opengl-and-vulkan/

# 用例

- https://github.com/xiaoyaoing/Vulkan-MeshShader-Grass

## geometry shader の代用

- https://docs.vulkan.org/samples/latest/samples/extensions/gshader_to_mshader/README.html

## quad

- @2022 [VulkanのMesh shaderに入門してみた](https://zenn.dev/nishiki/articles/8a325ed86337b0)
- @2020 [Mesh Shader による四角ポリゴンベースのメッシュ描画](https://zenn.dev/texhnologix/articles/1f985f86caa57baf1cca)

## SubDiv

- @2024 [Mesh shaderを活用したスキニングメッシュに対するサブディビジョンサーフェス | CEDiL](https://cedil.cesa.or.jp/cedil_sessions/view/2987)

## LOD

- @2023 [03 Hello Mesh - Tellusim Technologies Inc.](https://tellusim.com/03_hello_mesh/)

## Culling

- @2026 [【DirectX12】MeshShaderの実装＆カリング #Shader - Qiita](https://qiita.com/HoNuN/items/871b3de22e948c381a0e)
- @2023 [もんしょの巣穴 - DirectXの話 第189回](https://sites.google.com/site/monshonosuana/directx%E3%81%AE%E8%A9%B1/directx%E3%81%AE%E8%A9%B1-%E7%AC%AC189%E5%9B%9E)

