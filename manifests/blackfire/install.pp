# Class for installing Blackfire.io PHP profiler
#
# PHP must be flagged for installation.
#
class puphpet::blackfire::install
  inherits puphpet::params
{

  $blackfire = $puphpet::params::hiera['blackfire']

  $settings = deep_merge($blackfire['settings'], {
    'php' => {
      'ini_path' => "/etc/php/${puphpet::php::params::version_match}/mods-available/blackfire.ini",
    },
  })

  create_resources('class', {
    'blackfire' => $settings
  })

}
