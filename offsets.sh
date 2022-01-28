#!/bin/bash
PART_SIZES=(0x00100000 0x00100000 0x00500000 0x00400000 0x00500000 0x00800000 \
            0x04100000 0x00500000 0x00800000 0x04100000 0x01400000 0x04500000 )
PART_NAMES=(boot       env        conf       logo       kernel1    rootfs1    \
            app1       kernel2    rootfs2    app2       vas        data       )
OFFSET=0
for i in "${!PART_NAMES[@]}"; do
    size="${PART_SIZES[$i]}"
    name="${PART_NAMES[$i]}"
    echo "$name $OFFSET"
    eval "${name}_offset=$(( $OFFSET ))"
    eval "${name}_size=$(( $size ))"
    OFFSET=$(( $OFFSET + $size ))
done

# echo offset_boot $offset_boot
# echo offset_env $offset_env
