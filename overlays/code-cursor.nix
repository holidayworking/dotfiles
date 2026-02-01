{
  delib,
  inputs,
  system,
  ...
}:
delib.overlayModule {
  name = "code-cursor";
  overlay = inputs.code-cursor.overlays.default;
}
