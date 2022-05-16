#!/bin/bash
echo "This utility is about to setup a Grav instance with Wheat as a starter theme."
echo "Make sure you run this from the root of your project's folder."
echo
echo "Are you ready and sure you want to run the installer? [Yy][ctrl+c to exit]"
read RUN
if [[ $RUN =~ ^[Yy]$ ]]
    echo
    echo "Enter your theme's name (all lowercase, without the grav-theme prefix)." 
    echo
    read THEME_NAME
    # echo
    # echo "If you are using XAMPP or WAMPP, and your project is not in the webroot, enter the full path to it. Otherwise, just press [ENTER]."
    # echo
    # read WEB_ROOT
    echo
    echo "Fetching grav-admin"
    curl -L -sS "https://getgrav.org/download/core/grav-admin/1.7.33" -o grav-admin.zip
    echo "Unziping grav-admin"
    unzip -qq grav-admin.zip -d .
    echo "Cleaning"
    rm -r grav-admin.zip
    echo "Fetching wheat"
    curl -L -sS "https://github.com/hotdoy/grav-theme-wheat/archive/refs/heads/master.zip" -o wheat.zip
    echo "Unziping wheat"
    unzip -qq wheat.zip -d .
    echo "Cleaning"
    rm -r wheat.zip
    echo "Renaming files"
    mv -i grav-theme-wheat-master grav-theme-$THEME_NAME
    mv -i grav-theme-$THEME_NAME/wheat.php grav-theme-$THEME_NAME/$THEME_NAME.php
    mv -i grav-theme-$THEME_NAME/wheat.yaml grav-theme-$THEME_NAME/$THEME_NAME.yaml
    windows() { [[ -n "$WINDIR" ]]; }
    GRAV_DIR="$PWD"/grav-admin
    GRAV_USER_DIR="$PWD"/grav-admin/user
    PROJECT_USER_DIR="$PWD"/user
    GRAV_THEME_DIR="$PWD"/user/themes/"$THEME_NAME"
    PROJECT_THEME_DIR="$PWD"/grav-theme-"$THEME_NAME"
    echo "Moving user folder"
    mv grav-admin/user .
    sed -i -e "s/wheat/$THEME_NAME/g" grav-theme-$THEME_NAME/blueprints.yaml
    sed -i -e "s/Wheat/${THEME_NAME^}/g" grav-theme-$THEME_NAME/blueprints.yaml
    sed -i -e "s/Wheat/${THEME_NAME^}/g" grav-theme-$THEME_NAME/$THEME_NAME.php
    if windows; then
        echo "Symlinking project for Windows"
        # if [ $WEB_ROOT ]; then
        #     MSYS=winsymlinks:nativestrict ln -s $GRAV_DIR $WEB_ROOT/$THEME_NAME
        # fi
        MSYS=winsymlinks:nativestrict ln -s $PROJECT_USER_DIR $GRAV_USER_DIR
        MSYS=winsymlinks:nativestrict ln -s $PROJECT_THEME_DIR $GRAV_THEME_DIR
    else
        echo "Symlinking project for Linux/Mac"
        # if [ $WEB_ROOT ]; then
        #     ln -s $WEB_ROOT/$THEME_NAME $GRAV_DIR
        # fi
        ln -s $PROJECT_USER_DIR $GRAV_USER_DIR
        ln -s $PROJECT_THEME_DIR $GRAV_THEME_DIR
    fi
    then echo "All set! [tap any key to exit]"
    read
fi
