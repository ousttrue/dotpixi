- @2017 [新しい csproj 形式 | ++C++; // 未確認飛行 C ブログ](https://ufcpp.net/blog/2017/5/newcsproj/)
- [MSBuild csproj 小ネタ集 #MSBuild - Qiita](https://qiita.com/kenjiuno/items/d810505dfa26832e029d)

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>netstandard1.4</TargetFramework>
  </PropertyGroup>
</Project>
```

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net10.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
    <Nullable>enable</Nullable>
    <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
  </PropertyGroup>
```

## Property and Item

- [プロパティと項目の比較 - MSBuild | Microsoft Learn](https://learn.microsoft.com/ja-jp/visualstudio/msbuild/comparing-properties-and-items?view=visualstudio)

- @(Item)
- %(Item ?)
- $(Prop)

```xml
<ItemGroup>
    <OutputDir Include="KeyFiles\;Certificates\" />
</ItemGroup>
<PropertyGroup>
    <OutputDirList>@(OutputDir)</OutputDirList>
</PropertyGroup>
```

## default

```xml
<ItemGroup>
  <Compile Include="**/*.cs" />
</ItemGroup>
```

## target

- [ビルド プロセスを拡張してカスタマイズする - MSBuild | Microsoft Learn](https://learn.microsoft.com/ja-jp/visualstudio/msbuild/how-to-extend-the-visual-studio-build-process?view=visualstudio)

## var

- [MSBuild のコマンドとプロパティの共通マクロ | Microsoft Learn](https://learn.microsoft.com/ja-jp/cpp/build/reference/common-macros-for-build-commands-and-properties?view=msvc-170)

|               |     |
| ------------- | --- |
| $(ProjectDir) | .   |
| $(TargetDir)  | bin |


## item

- [MSBuild Well-known Item Metadata - MSBuild | Microsoft Learn](https://learn.microsoft.com/en-us/visualstudio/msbuild/msbuild-well-known-item-metadata?view=visualstudio)
