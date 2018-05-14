# converts seconds to time
# https://stackoverflow.com/questions/12199631
function convertsecs() {
    h=$(bc <<< "${1}/3600")
    m=$(bc <<< "(${1}%3600)/60")
    s=$(bc <<< "${1}%60")
    printf "%02d:%02d:%05.2f\n" $h $m $s
}
