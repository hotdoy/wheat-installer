#!/bin/bash
echo "Enter your theme's name (without the grav-theme part) ... "  
read THEME_NAME
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
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
    ADMIN_USER_DIR="$PWD"/grav-admin/user
    PROJECT_USER_DIR="$PWD"/user
    ADMIN_THEME_DIR="$PWD"/user/themes/"$THEME_NAME"
    PROJECT_THEME_DIR="$PWD"/grav-theme-"$THEME_NAME"
    echo "Moving user folder"
    mv grav-admin/user .
    sed -i -e "s/wheat/$THEME_NAME/g" grav-theme-$THEME_NAME/blueprints.yaml
    sed -i -e "s/Wheat/${THEME_NAME^}/g" grav-theme-$THEME_NAME/blueprints.yaml
    sed -i -e "s/Wheat/${THEME_NAME^}/g" grav-theme-$THEME_NAME/wheat.php
    if windows; then
        echo "Symlinking project for Windows"
        MSYS=winsymlinks:nativestrict ln -s $PROJECT_USER_DIR $ADMIN_USER_DIR
        MSYS=winsymlinks:nativestrict ln -s $PROJECT_THEME_DIR $ADMIN_THEME_DIR
    else
        echo "Symlinking project for Linux/Mac"
        ln -s $PROJECT_USER_DIR $ADMIN_USER_DIR
        ln -s $PROJECT_THEME_DIR $ADMIN_THEME_DIR
    fi
    then     echo "All set!"
fi
