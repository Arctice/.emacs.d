
(use-package dired
  :defer t
  :config
  (setq dired-dwim-target t)
  (setq dired-listing-switches "-alhF"))

(use-package dired-subtree
  :after dired
  :config
  (bind-keys :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("<C-down>" . dired-subtree-next-sibling)
    ("<C-up>" . dired-subtree-previous-sibling)))

(use-package dired-collapse-mode
  :hook dired-mode)

(use-package dired-ranger
  :after dired)

(use-package dired-list
  :commands (dired-list-mpc
             dired-list-git-ls-files
             dired-list-hg-locate
             dired-list-locate
             dired-list-find-file
             dired-list-find-name
             dired-list-grep))

(use-package dired-rainbow
  :after dired
  :config
  (progn

    ;; auto-generated from LS_COLORS, to be sorted out later
    (dired-rainbow-define BLK "#2a54a8" ("BLK"))
    (dired-rainbow-define CAPABILITY "#00002a" ("CAPABILITY"))
    (dired-rainbow-define CHR "#54a82a" ("CHR"))
    (dired-rainbow-define DOOR "#7e007e" ("DOOR"))
    (dired-rainbow-define EXEC "#d25400" ("EXEC" ".pl" ".xib"))
    (dired-rainbow-define FIFO "#7e0054" ("FIFO"))
    (dired-rainbow-define MULTIHARDLINK "#d2a854" ("MULTIHARDLINK" ".msql" ".mysql" ".pgsql" ".sql"))
    (dired-rainbow-define ORPHAN "#080808" ("ORPHAN" ".diff" ".patch"))
    (dired-rainbow-define OTHER_WRITABLE "#d2a800" ("OTHER_WRITABLE" "SETUID" "*README" "*README.rst" "*README.md" "*LICENSE" "*COPYING" "*INSTALL" "*COPYRIGHT" "*AUTHORS" "*HISTORY" "*CONTRIBUTORS" "*PATENTS" "*VERSION" "*NOTICE" "*CHANGES"))
    (dired-rainbow-define SETGID "#000316" ("SETGID"))
    (dired-rainbow-define SOCK "#d2002a" ("SOCK" ".git"))
    (dired-rainbow-define STICKY "#2ad2a8" ("STICKY"))
    (dired-rainbow-define STICKY_OTHER_WRITABLE "#7e547e" ("STICKY_OTHER_WRITABLE"))
    (dired-rainbow-define *LS_COLORS "#54002a" ("*LS_COLORS"))
    (dired-rainbow-define .log "#a8d200" ("log"))
    (dired-rainbow-define .txt "#dadada" ("txt"))
    (dired-rainbow-define .etx "#a8a800" ("etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textile"))
    (dired-rainbow-define .bib "#a87e00" ("bib" "json" "jsonl" "ndjson" "msg" "pgn" "rss" "xml" "fxml" "toml" "yaml" "yml" "RData" "rdata" "xsd" "dtd" "sgml" "rng" "rnc" "dhall"))
    (dired-rainbow-define .cbr "#7e54d2" ("cbr" "cbz" "chm" "djvu" "pdf" "PDF" "mobi" "epub"))
    (dired-rainbow-define .docm "#547ed2" ("docm" "doc" "docx" "odb" "odt" "rtf" "pages"))
    (dired-rainbow-define .odp "#a82a00" ("odp" "pps" "ppt" "pptx" "ppts" "pptxm" "pptsm" "key" "iml"))
    (dired-rainbow-define .csv "#2aa854" ("csv" "tsv"))
    (dired-rainbow-define .ods "#54a800" ("ods" "xls" "xlsx" "xlsxm" "numbers" "allow"))
    (dired-rainbow-define .xla "#2aa800" ("xla"))
    (dired-rainbow-define .xltm "#2a7e7e" ("xltm" "xltx"))
    (dired-rainbow-define .gitignore "#585858" ("gitignore" "gitattributes" "gitmodules" "pyc" "dockerignore" "*pm_to_blib"))
    (dired-rainbow-define .awk "#a85400" ("awk" "bash" "bat" "BAT" "sed" "sh" "zsh" "vim" "kak"))
    (dired-rainbow-define .ahk "#00a82a" ("ahk" "py" "ipynb" "rb" "gemspec" "clj" "cljs" "cljc" "cljw" "scala"))
    (dired-rainbow-define .PL "#a80000" ("PL" "err" "error" "stderr"))
    (dired-rainbow-define .t "#54a854" ("t" "avi" "divx" "IFO" "m2v" "m4v" "mkv" "MOV" "mov" "mp4" "mpeg" "mpg" "ogm" "rmvb" "sample" "wmv"))
    (dired-rainbow-define .tcl "#2a5400" ("tcl"))
    (dired-rainbow-define .r "#00d27e" ("r" "R"))
    (dired-rainbow-define .gs "#2aa8d2" ("gs" "asm" "cl" "lisp" "rkt" "lua" "moon" "c" "C" "c++" "cc" "cs" "cp" "cpp" "cxx" "cr" "go" "f" "F" "for" "ftn" "f90" "F90" "f95" "F95" "f03" "F03" "f08" "F08" "nim" "nimble" "rs" "sx" "vala" "vapi" "hs" "lhs" "agda" "lagda" "lagda.tex" "lagda.rst" "lagda.md" "zig" "php" "ctp" "twig" "vb" "vba" "vbs"))
    (dired-rainbow-define .dart "#00d2d2" ("dart"))
    (dired-rainbow-define .h "#547ea8" ("h" "H" "tcc" "h++" "hpp" "hxx" "ii" "M" "m" "s" "S" "hi" "agdai"))
    (dired-rainbow-define .scpt "#d27ed2" ("scpt" "swift"))
    (dired-rainbow-define .tf "#a82a54" ("tf" "tfstate" "tfvars"))
    (dired-rainbow-define .css "#7e002a" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache"))
    (dired-rainbow-define .coffee "#2a7ea8" ("coffee" "java" "js" "mjs" "jsm" "jsp"))
    (dired-rainbow-define *Dockerfile "#7ed22a" ("*Dockerfile" "*Makefile" "nix" "rake"))
    (dired-rainbow-define *MANIFEST "#767676" ("*MANIFEST"))
    (dired-rainbow-define .am "#6c6c6c" ("am" "in" "hin" "scan" "m4" "old" "out"))
    (dired-rainbow-define .SKIP "#808080" ("SKIP" "swp" "swo" "tmp" "sassc"))
    (dired-rainbow-define .bmp "#542a7e" ("bmp" "dicom" "tiff" "tif" "TIFF" "cdr" "flif" "gif" "icns" "ico" "jpeg" "JPG" "jpg" "nth" "png" "psd" "pxd" "pxm" "xpm" "webp"))
    (dired-rainbow-define .ai "#542ad2" ("ai" "eps" "epsf" "drw" "ps" "svg"))
    (dired-rainbow-define .3g2 "#54a87e" ("3g2" "3gp" "gp3" "webm" "gp4" "asf" "flv" "ts" "ogv" "f4v" "VOB" "vob"))
    (dired-rainbow-define .ass "#54a8d2" ("ass" "srt" "ssa" "sub" "sup" "vtt"))
    (dired-rainbow-define .3ga "#7e542a" ("3ga" "S3M" "aac" "amr" "au" "caf" "dat" "dts" "fcm" "m4a" "mid" "mod" "mp3" "mp4a" "oga" "ogg" "opus" "s3m" "sid" "wma"))
    (dired-rainbow-define .ape "#7e5400" ("ape" "aiff" "cda" "flac" "alac" "midi" "pcm" "wav" "wv" "wvc"))
    (dired-rainbow-define .afm "#2a5454" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf" "woff" "woff2" "PFA" "pfa"))
    (dired-rainbow-define .7z "#00a800" ("7z" "a" "arj" "bz2" "cpio" "gz" "lrz" "lz" "lzma" "lzo" "rar" "s7z" "sz" "tar" "tgz" "xz" "z" "zip" "zipx" "zoo" "zpaq" "zst" "zstd" "zz"))
    (dired-rainbow-define .apk "#d27e2a" ("apk" "ipa" "deb" "rpm" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp" "dmg"))
    ;; (dired-rainbow-define .r[0-9]{0,2} "#4e4e4e" ("r[0-9]{0,2}" "zx[0-9]{0,2}" "z[0-9]{0,2}" "part" "DS_Store" "localized" "CFUserTextEncoding" "*CodeResources" "*PkgInfo"))
    (dired-rainbow-define .iso "#7e0000" ("iso" "bin" "nrg" "qcow" "sparseimage" "toast" "vcd" "vmdk"))
    (dired-rainbow-define .accdb "#2a2a54" ("accdb" "accde" "accdr" "accdt" "db" "fmp12" "fp7" "localstorage" "mdb" "mde" "sqlite" "typelib" "nc"))
    (dired-rainbow-define .pacnew "#0054d2" ("pacnew"))
    (dired-rainbow-define .un~ "#626262" ("un~" "orig" "BUP" "bak" "o" "*core" "mdump" "rlib" "dll" "aria2" "dump" "stackdump" "zcompdump" "zwc" "dylib"))
    (dired-rainbow-define .pid "#a8a8a8" ("pid" "state" "*lockfile" "*lock"))
    (dired-rainbow-define .pcap "#00542a" ("pcap" "cap" "dmp"))
    (dired-rainbow-define .deny "#d20000" ("deny" "storyboard"))
    (dired-rainbow-define .service "#00a8d2" ("service" "*@.service" "socket" "swap" "device" "mount" "automount" "target" "path" "timer" "snapshot"))
    (dired-rainbow-define .application "#54a8a8" ("application" "cue" "description" "directory" "m3u" "m3u8" "md5" "properties" "sfv" "theme" "torrent" "urlview" "webloc"))
    (dired-rainbow-define .lnk "#007ed2" ("lnk"))
    (dired-rainbow-define .nib "#2a00d2" ("nib" "car"))
    (dired-rainbow-define .asc "#a8d254" ("asc" "bfe" "enc" "gpg" "signature" "sig" "p12" "pem" "pgp" "p7s" "*id_dsa" "*id_rsa" "*id_ecdsa" "*id_ed25519"))
    (dired-rainbow-define .32x "#d254d2" ("32x" "cdi" "fm2" "rom" "sav" "st" "a00" "a52" "A64" "a64" "a78" "adf" "atr" "gb" "gba" "gbc" "gel" "gg" "ggl" "ipk" "j64" "nds" "nes" "sms"))
    (dired-rainbow-define .8xp "#54d27e" ("8xp" "8eu" "82p" "83p" "8xe"))
    (dired-rainbow-define .stl "#d27e54" ("stl" "dwg" "ply" "wrl"))
    (dired-rainbow-define .pot "#f5f1de" ("pot" "pcb" "mm" "gbr" "scm" "xcf" "spl" "sis" "1p" "3p" "cnc" "def" "ex" "example" "feature" "ger" "ics" "map" "mf" "mfasl" "mi" "mtx" "pc" "pi" "plt" "pm" "rdf" "ru" "sch" "sty" "sug" "tdy" "tfm" "tfnt" "tg" "vcard" "vcf" "xln"))
    (dired-rainbow-define .Rproj "#ffff00" ("Rproj"))


    (dired-rainbow-define-chmod .directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")
    )) 
