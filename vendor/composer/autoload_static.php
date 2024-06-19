<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitb70e1a49b1fdef04842c49d05833c949
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitb70e1a49b1fdef04842c49d05833c949::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitb70e1a49b1fdef04842c49d05833c949::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitb70e1a49b1fdef04842c49d05833c949::$classMap;

        }, null, ClassLoader::class);
    }
}