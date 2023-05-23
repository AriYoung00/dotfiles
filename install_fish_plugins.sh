# first install fisher
if not type -q fisher
    echo "You need to install fisher"
    exit 1
end

fisher install franciscolourenco/done
fisher install edc/bass
fisher install jorgebucaran/autopair.fish
