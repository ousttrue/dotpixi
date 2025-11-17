https://developer.android.com/guide/topics/manifest/manifest-intro

# AndroidManifest.xml

```xml
<manifest ... >
    <application ... >
        <activity android:name="com.example.myapp.MainActivity" ... >
        </activity>
    </application>
</manifest>
```

## feature

```xml
<!-- Tell the system this app requires OpenGL ES 3.1. -->
<uses-feature
  android:glEsVersion="0x00030001"
  android:required="true"
  />
```

```xml
<uses-feature
  android:name="android.hardware.vr.headtracking"
  android:required="true"
  />
```

```xml
<!-- Tell the system this app uses experimental extensions -->
<uses-feature
  android:name="com.oculus.experimental.enabled"
  android:required="true"
  />
```

### com.oculus.software.body_tracking

```xml
<uses-feature
  android:name="com.oculus.software.body_tracking" />
```

### com.oculus.feature.PASSTHROUGH

```xml
<uses-feature
  android:name="com.oculus.feature.PASSTHROUGH"
  android:required="true"
  />
```

## permission

```xml
<!-- Allow access to XR_META_boundary_visibility extension -->
<uses-permission
  android:name="com.oculus.permission.BOUNDARY_VISIBILITY" />
```

```xml
<!-- Allow access to TrackingEnvironment functionality -->
<uses-permission
  android:name="com.oculus.permission.ACCESS_TRACKING_ENV" />
```

```xml
  <!-- Request permission to use Scene -->
  <uses-permission android:name="com.oculus.permission.USE_SCENE" />
  <!-- Allow access to Spatial Anchors -->
  <uses-permission android:name="com.oculus.permission.USE_ANCHOR_API" />
```
