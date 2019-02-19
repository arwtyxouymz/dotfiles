PROGNAME=$(basename $0)
HELP_MSG="'$PROGNAME -h'と指定することでヘルプを見ることができます"

# ヘルプメッセージ
usage() {
  echo "Usage: $PROGNAME [--all]"
  echo 
  echo "オプション:"
  echo "  -h, --help"
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
        *)
          # コマンド引数（オプション以外のパラメータ）
          echo $'\e[31m$PROGNAME: オプションが無効です。"$PROGNAME -h"で確認してください\e[0m' 1>&2
          exit 1
          ;;
      esac
    done
}
