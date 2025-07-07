{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  nix-update-script,
}:

buildNpmPackage rec {
  pname = "opencommit";
  version = "3.2.9";

  src = fetchFromGitHub {
    owner = "di-sukharev";
    repo = "opencommit";
    rev = "v${version}";
    hash = "sha256-CXVOIkc73f6/gyqrn6tjj/I6we/XBDQoxUVUlX9PzRc=";
  };

  npmDepsHash = "sha256-Fu6i0nqK1osU5HYF7lz7AbWhAmLO9/JOMcpoe1qbb0w=";

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "AI-powered commit message generator";
    homepage = "https://www.npmjs.com/package/opencommit";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.matteopacini ];
    mainProgram = "oco";
  };

}
