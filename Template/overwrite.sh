function OVERWRITE_IMG(){
    DOWN=$1; STOR=$2; IMG=$3; SIZE=$4; ID=$5
    TARGET_IMG=$(find $STOR -type f | grep $ID | grep -vE 'meta|lease')
    TARGET_META=$TARGET_IMG.meta
    mv $DOWN/$IMG $TARGET_IMG
    chown 36:36 $TARGET_IMG
    chcon system_u:object_r:fusefs_t:s0 $TARGET_IMG
    sed -e "s#^DESCRIPTION.*#DESCRIPTION={\"DiskAlias\":\"$IMG\",\"DiskDescription\":\"$IMG\"}#g;" -i $TARGET_META
    sed -e "s#^CAP.*#CAP=$SIZE#g;" -i $TARGET_META
    echo $IMG
}

DOWN=/rhev/data-center/mnt/downloads
STOR=/rhev/data-center/mnt/_opt_virtdom_data/60ae2736-e81d-4102-8662-f1f33aa01fec/images
#IMG=   ; SIZE= ; ID= ; OVERWRITE_IMG $DOWN $STOR $IMG $SIZE $ID;
