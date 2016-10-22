#!/bin/sh

#current file path
CURRENT_DIR=`dirname $0`
echo "CURRENT_DIR = ${CURRENT_DIR}"

#path Permissions
sudo chmod -R 777 $CURRENT_DIR

#input res path
IMAGE_DIR=$CURRENT_DIR/image
echo "IMAGE_DIR = ${IMAGE_DIR}"

#output plist path
PLIST_DIR=$CURRENT_DIR/plist
PLIST2_DIR=$CURRENT_DIR/plist2
echo "PLIST_DIR = ${PLIST_DIR}"
echo "PLIST2_DIR = ${PLIST2_DIR}"

#TexturePacker path
TP=/usr/local/bin/TexturePacker

# $1: Source Directory where the assets are located
# $2: Output File Name without extension
# $3: RGB Quality factor
# $4: Scale factor
# $5: Max-Size factor
# $6: Texture Type (PNG, PVR.CCZ)
# $7: Texture format
pack_textures(){

    ${TP} --smart-update \
        --texture-format $7 \
        --format cocos2d \
        --data "$2".plist \
        --sheet "$2".$6 \
        --maxrects-heuristics best \
        --enable-rotation \
        --scale $4 \
        --shape-padding 1 \
        --max-size $5 \
        --opt "$3" \
        --trim \
        $1/*.png \
        --size-constraints AnySize
}

if [ -d $PLIST_DIR ]
then
#remove all file in this path
    rm -f $PLIST_DIR/*
    rm -f $PLIST2_DIR/*
else
    mkdir -p $PLIST_DIR
    mkdir -p $PLIST2_DIR
fi

#convert
for i in $IMAGE_DIR/*
do
    if [ -d $i ]
    then
        echo "input $i"
        spriteSheetName=`basename $i`
        pack_textures $i $PLIST_DIR/$spriteSheetName "RGBA8888" 1 1024 "png" "png"
    else
        echo "${i} not exsit!"
    fi
done

#copy
cp -f $PLIST_DIR/* $PLIST2_DIR
