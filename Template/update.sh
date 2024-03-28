function UPDATE_DISK(){
    ALIAS=$1
    SIZE=$2
    ID=$3
    cd /var/lib/pgsql
    sudo -u postgres psql -d engine -c "UPDATE public.base_disks
    SET disk_alias = '$ALIAS',
        disk_description = '$ALIAS'
    WHERE disk_id ='$ID';

    UPDATE public.images
    SET size = $SIZE
    WHERE image_group_id = '$ID';"
    cd -
}

ALIAS= ; SIZE= ; ID=; UPDATE_DISK $ALIAS $SIZE $ID;
ALIAS= ; SIZE= ; ID=; UPDATE_DISK $ALIAS $SIZE $ID;
ALIAS= ; SIZE= ; ID=; UPDATE_DISK $ALIAS $SIZE $ID;
