{
  writeShellApplication,
  light,
}:
writeShellApplication {
  name = "kbd_light";
  runtimeInputs = [light];
  text = ''
    # Toggle keyboard backlight brightness
    dev="sysfs/leds/tpacpi::kbd_backlight"
    cur="$(light -s $dev -G)"
    new=$((''${cur%.*} > 0 ? 0 : 50))
    light -s $dev -S $new
  '';
}
