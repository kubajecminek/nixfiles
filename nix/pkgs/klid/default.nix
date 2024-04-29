{
  lib,
  fetchFromGitHub,
  trivialBuild,
}:
trivialBuild {
  pname = "klid";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "kubajecminek";
    repo = "klid";
    rev = "9a71e6fb1a45fe3b1d880414a278c732ea58df56";
    sha256 = "sha256-EZfArw6s3cwJ7OJIj/sJtgjhDD/tCdzTTCip7X/x6Q8=";
  };

  meta = {
    description = "Accounting software for the hackers";
    homepage = "https://github.com/kubajecminek/klid";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.all;
  };
}
