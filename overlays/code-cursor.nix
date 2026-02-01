{ delib, inputs, ... }:
delib.overlayModule {
  name = "code-cursor";
  overlay = inputs.code-cursor.overlays.default;
}
