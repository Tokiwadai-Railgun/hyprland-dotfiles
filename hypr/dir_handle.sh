for line in $(ls -d ./* | grep .conf) ; do
  hyprconf2lua $line -o "/home/fuyuki/.config/hypr/lua/$(basename $line .conf).lua"
done
