
#kullanılan sürüm zafiyet kontrolü için ./pipekontrol.sh
#başka bir kernel sürümü kontrolü için ./pipekontrol.sh xx.xx.xxx

kernel=$1
ver1=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f1)
ver2=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f2)
ver3=$(echo ${kernel:-$(uname -r | cut -d '-' -f1)} | cut -d '.' -f3)
echo test edilen kernel sürümü: $ver1 $ver2 $ver3

if (( ${ver1:-0} < 5 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} < 8 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} == 10 && ${ver3:-0} == 102 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} == 10 && ${ver3:-0} == 92 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} == 15 && ${ver3:-0} == 25 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} >= 16 && ${ver3:-0} >= 11 )) ||
   (( ${ver1:-0} == 5 && ${ver2:-0} > 16 ));
then
    echo Zafiyetli
    exit 0
else
    echo Zafiyetli değil
    exit 1
fi
