PROGNAME=$(basename $0)
HELP_MSG="'$PROGNAME -h'と指定することでヘルプを見ることができます"

# ヘルプメッセージ
usage() {
  echo "Usage: $PROGNAME [--all]"
  echo 
  echo "オプション:"
  echo "  -h, --help"
  echo "  -a, --all  [任意]"
  echo "  -w, --web  [任意]"
  echo "  -i, --itkvtk  [任意]"
  echo
  exit
}


check_arguments() {
    # オプション解析
    for OPT in "$@"
    do
      case "$OPT" in
        # ヘルプメッセージ
        '-h'|'--help' )
          usage
          exit
          ;;
        # オプション-a、--all
        '-a'|'--all' )
          ALL_FLAG=1
          export ALL_FLAG
          shift 1
          ;;
        # オプション-w、--web
        '-w'|'--web' )
          WEB_FLAG=1
          export WEB_FLAG
          shift 1
          ;;
        # オプション-i、--itkvtk
        '-i'|'--itkvtk' )
          ITKVTK_FLAG=1
          export ITKVTK_FLAG
          shift 1
          ;;
        *)
          # コマンド引数（オプション以外のパラメータ）
          echo $'\e[31m$PROGNAME: オプションが無効です。"$PROGNAME -h"で確認してください\e[0m' 1>&2
          exit 1
          ;;
      esac
    done
}
