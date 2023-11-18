# Installer components to load:
# Choices: choose-mirror: Choose mirror to install from (menu item), crypto-dm-modules-6.3.0-kali1-amd64-di: devicemapper crypto module, driver-injection-disk-detect: Detect OEM driver injection disks, f2fs-modules-6.3.0-kali1-amd64-di: f2fs filesystem support, fdisk-udeb: Manually partition a hard drive (fdisk), fuse-modules-6.3.0-kali1-amd64-di: FUSE modules, load-media: Load installer components from removable media, lowmem: free memory for lowmem install, mbr-udeb: Master Boot Record for IBM-PC compatible computers, multipath-modules-6.3.0-kali1-amd64-di: Multipath support, nbd-modules-6.3.0-kali1-amd64-di: Network Block Device modules, network-console: Continue installation remotely using SSH, openssh-client-udeb: secure shell client for the Debian installer, parted-udeb: Manually partition a hard drive (parted), ppp-modules-6.3.0-kali1-amd64-di: PPP drivers, ppp-udeb: Point-to-Point Protocol (PPP) - package for Debian Installer, reiserfsprogs-udeb: User-level tools for ReiserFS filesystems, rescue-mode: mount requested partition and start a rescue shell, scsi-nic-modules-6.3.0-kali1-amd64-di: SCSI drivers for converged NICs, squashfs-modules-6.3.0-kali1-amd64-di: squashfs modules, udf-modules-6.3.0-kali1-amd64-di: UDF modules
d-i     anna/choose_modules     multiselect
# Installer components to load:
# Choices:
d-i     anna/choose_modules_lowmem      multiselect
# Failed to load installer component
d-i     anna/install_failed     error
# Continue the install without loading kernel modules?
d-i     anna/no_kernel_modules  boolean false
# for internal use only
d-i     anna/retriever  string  cdrom-retriever
# for internal use; can be preseeded
d-i     anna/standard_modules   boolean true
# apt configuration problem
apt-cdrom-setup apt-setup/cdrom/failed  error
# Scan extra installation media?
apt-cdrom-setup apt-setup/cdrom/set-double      boolean true
# Scan extra installation media?
apt-cdrom-setup apt-setup/cdrom/set-failed      boolean true
# Scan extra installation media?
apt-cdrom-setup apt-setup/cdrom/set-first       boolean false
unknown apt-setup/cdrom/set-first       boolean false
# Scan extra installation media?
apt-cdrom-setup apt-setup/cdrom/set-next        boolean false
# Use contrib software?
apt-mirror-setup        apt-setup/contrib       boolean true
unknown apt-setup/contrib       boolean true
# for internal use; can be preseeded
apt-cdrom-setup apt-setup/disable-cdrom-entries boolean true
unknown apt-setup/disable-cdrom-entries boolean true
# Enable source repositories in APT?
apt-setup-udeb  apt-setup/enable-source-repositories    boolean false
unknown apt-setup/enable-source-repositories    boolean false
# Downloading local repository key failed:
# Choices: Retry, Ignore
apt-setup-udeb  apt-setup/local/key-error       select  Retry
# Downloading a file failed:
# Choices: Retry, Change mirror, Ignore
apt-mirror-setup        apt-setup/mirror/error  select  Retry
# for internal use; can be preseeded
apt-setup-udeb  apt-setup/multiarch     string
# Continue without a network mirror?
apt-mirror-setup        apt-setup/no_mirror     boolean false
# Use non-free software?
apt-mirror-setup        apt-setup/non-free      boolean true
unknown apt-setup/non-free      boolean true
# Use non-free firmware?
apt-mirror-setup        apt-setup/non-free-firmware     boolean true
unknown apt-setup/non-free-firmware     boolean true
# for internal use; can be preseeded
apt-setup-udeb  apt-setup/security_host string  security.debian.org
# Cannot access repository
apt-setup-udeb  apt-setup/service-failed        error
# Services to use:
# Choices: security updates (from security.debian.org), release updates, backported software
apt-setup-udeb  apt-setup/services-select       multiselect
unknown apt-setup/services-select       multiselect
# Use a network mirror?
apt-mirror-setup        apt-setup/use_mirror    boolean false
# Dummy template for preseeding unavailable questions
unknown atftpd/use_inetd        string  false
# for internal use; can be preseeded
network-preseed auto-install/defaultroot        string  d-i/trixie/./preseed.cfg
# for internal use; can be preseeded
network-preseed auto-install/enable     boolean false
# Cannot install base system
bootstrap-base  base-installer/cannot_install   error
# Failed to install the base system
bootstrap-base  base-installer/debootstrap-failed       error
# Base system installation error
bootstrap-base  base-installer/debootstrap/error-abnormal       error
# Base system installation error
bootstrap-base  base-installer/debootstrap/error-exitcode       error
# Debootstrap Error
bootstrap-base  base-installer/debootstrap/error/couldntdl      error
# Debootstrap Error
bootstrap-base  base-installer/debootstrap/error/invalidrel     error
# Debootstrap Error
bootstrap-base  base-installer/debootstrap/error/missingrelentry        error
# Debootstrap Error
bootstrap-base  base-installer/debootstrap/error/nogetrel       error
# Debootstrap Error
bootstrap-base  base-installer/debootstrap/error/nogetrelsig    error
# Debootstrap Error
bootstrap-base  base-installer/debootstrap/error/unknownrelsig  error
# Debootstrap Error
bootstrap-base  base-installer/debootstrap/fallback-error       error
# Debootstrap warning
bootstrap-base  base-installer/debootstrap/fallback-warning     error
# for internal use; can be preseeded
bootstrap-base  base-installer/debootstrap_script       string
# for internal use; can be preseeded
bootstrap-base  base-installer/excludes string
# for internal use; can be preseeded
bootstrap-base  base-installer/includes string
# Drivers to include in the initrd:
# Choices: generic: include all available drivers, targeted: only include drivers needed for this system
bootstrap-base  base-installer/initramfs-tools/driver-policy    select  most
# Tool to use to generate boot initrd:
# Choices:
bootstrap-base  base-installer/initramfs/generator      select
# Unsupported initrd generator
bootstrap-base  base-installer/initramfs/unsupported    error
# for internal use; can be preseeded
base-installer  base-installer/install-recommends       boolean true
# Unable to install the selected kernel
bootstrap-base  base-installer/kernel/failed-install    error
# Unable to install
bootstrap-base  base-installer/kernel/failed-package-install    error
# Kernel to install:
# Choices: linux-image-6.3.0-kali1-amd64,linux-image-amd64, none
bootstrap-base  base-installer/kernel/image     select  linux-image-amd64
# for internal use; can be preseeded
bootstrap-base  base-installer/kernel/linux/extra-packages      string
# for internal use; can be preseeded
bootstrap-base  base-installer/kernel/linux/extra-packages-2.6  string
# for internal use
bootstrap-base  base-installer/kernel/linux/initramfs-tools/driver-policy       string  most
# for internal use only
bootstrap-base  base-installer/kernel/linux/initrd-2.6  boolean true
# for internal use only
bootstrap-base  base-installer/kernel/linux/link_in_boot        boolean false
# Cannot install kernel
bootstrap-base  base-installer/kernel/no-kernels-found  error
# Continue without installing a kernel?
bootstrap-base  base-installer/kernel/skip-install      boolean false
# Debootstrap Error
bootstrap-base  base-installer/no_codename      error
# No file system mounted on /target
base-installer  base-installer/no_target_mounted        error
# Not installing to unclean target
base-installer  base-installer/unclean_target_cancel    error
# Proceed with installation to unclean target?
base-installer  base-installer/use_unclean_target       boolean true
# Insert Debian installation media
d-i     cdrom-checker/askmount  note
# Insert Debian boot media
d-i     cdrom-checker/firstcd   note
# Failed to open checksum file
d-i     cdrom-checker/md5file_failed    error
# Integrity test failed
d-i     cdrom-checker/mismatch  error
# Failed to mount installation media
d-i     cdrom-checker/mntfailed error
# Check the integrity of another installation image?
d-i     cdrom-checker/nextcd    boolean false
# Integrity test successful
d-i     cdrom-checker/passed    note
# Check integrity of the installation media?
d-i     cdrom-checker/start     boolean false
# No valid Debian installation media
d-i     cdrom-checker/wrongcd   error
# Device file for accessing the installation media:
d-i     cdrom-detect/cdrom_device       string  /dev/sr0
# for internal use only
d-i     cdrom-detect/cdrom_fs   string  iso9660
# Module needed for accessing the installation media:
# Choices:
d-i     cdrom-detect/cdrom_module       select  none
# for internal use; can be preseeded
d-i     cdrom-detect/eject      boolean true
# for internal use only
d-i     cdrom-detect/hybrid     boolean false
# Load drivers from removable media?
d-i     cdrom-detect/load_media boolean true
# Manually select a module and device for installation media?
d-i     cdrom-detect/manual_config      boolean true
# Error reading Release file
d-i     cdrom-detect/no-release error
# Retry mounting installation media?
d-i     cdrom-detect/retry      boolean true
# Installation media detected
d-i     cdrom-detect/success    note
# UNetbootin media detected
d-i     cdrom-detect/unetbootin_detected        note
# for internal use only
d-i     cdrom-detect/usb-hdd    boolean false
# Incorrect installation media detected
d-i     cdrom-detect/wrong-cd   error
# for internal use only
d-i     cdrom/codename  string  kali-rolling
# for internal use only
# Choices: stable, testing, unstable
d-i     cdrom/suite     select  stable
# Wait another 30 seconds for hwclock to set the clock?
clock-setup     clock-setup/hwclock-wait        boolean false
# Set the clock using NTP?
clock-setup     clock-setup/ntp boolean true
# NTP server to use:
clock-setup     clock-setup/ntp-server  string  0.debian.pool.ntp.org
# for internal use only
clock-setup     clock-setup/system-time-changed boolean true
# Is the system clock set to UTC?
clock-setup     clock-setup/utc boolean true
# Dummy template for preseeding unavailable questions
unknown console-setup/charmap47 string  UTF-8
# for internal use only
d-i     debconf/frontend        string
# for internal use only
d-i     debconf/language        string  en
# Ignore questions with a priority less than:
# Choices: critical, high, medium, low
d-i     debconf/priority        select  high
# for internal use only
d-i     debconf/showold boolean false
# for internal use only
d-i     debconf/translations-dropped    boolean false
# for internal use; can be preseeded
d-i     debian-installer/add-kernel-opts        string
# for internal use; can be preseeded
d-i     debian-installer/allow_unauthenticated  boolean false
# for internal use; can be preseeded
d-i     debian-installer/allow_unauthenticated_ssl      boolean false
# for internal use only
d-i     debian-installer/consoledisplay string  console-setup
# for internal use; can be preseeded
d-i     debian-installer/country        string  US
# Make this ChromeOS board bootable
depthcharge-tools-installer     debian-installer/depthcharge-tools-installer/title      note
# Dummy template for preseeding unavailable questions
d-i     debian-installer/dummy  string
# for internal use only
d-i     debian-installer/exit/always_halt       boolean false
# for internal use; can be preseeded
d-i     debian-installer/exit/halt      boolean false
# for internal use; can be preseeded
d-i     debian-installer/exit/poweroff  boolean false
# for internal use; can be preseeded
d-i     debian-installer/framebuffer    boolean true
# for internal use only
d-i     debian-installer/language       string  en
# System locale:
# Choices:
d-i     debian-installer/locale select  en_US.UTF-8
# Choose the next step in the install process:
# Choices: Choose language, Access software for a blind person using a braille display, Configure the speech synthesizer voice, Configure the keyboard, Detect and mount installation media, Load debconf preconfiguration file, Load installer components from installation media, Detect network hardware, Configure the network, Set up users and passwords, Configure the clock, Detect disks, Partition disks, Install the base system, Configure the package manager, Select and install software, Install the GRUB boot loader, Continue without boot loader, Finish the installation, Change debconf priority, Check the integrity of installation media, Save debug logs, Execute a shell, Eject a CD from the drive, Abort the installation
d-i     debian-installer/main-menu      select  Finish the installation
# Installation step failed
d-i     debian-installer/main-menu/item-failure error
# Choose an installation step:
# Choices:
d-i     debian-installer/missing-provide        select  ${DEFAULT}
#
d-i     debian-installer/shell-plugin   terminal
# Terminal plugin not available
d-i     debian-installer/terminal-plugin-unavailable    error
# for internal use; can be preseeded
d-i     debian-installer/theme  string  Clearlooks-Purple
# for internal use; can be preseeded
depthcharge-tools-installer     depthcharge-tools-installer/board       string
# Cannot build a boot image
depthcharge-tools-installer     depthcharge-tools-installer/error/build_image   error
# No usable ChromeOS kernel partition is found
depthcharge-tools-installer     depthcharge-tools-installer/error/check_parts   error
# Unable to install
depthcharge-tools-installer     depthcharge-tools-installer/error/failed-package-install        error
# Cannot write boot image to disk
depthcharge-tools-installer     depthcharge-tools-installer/error/write_image   error
# Reconfigure initramfs policies?
depthcharge-tools-installer     depthcharge-tools-installer/initramfs_too_big   boolean
# Making this ChromeOS board bootable
depthcharge-tools-installer     depthcharge-tools-installer/progress    note
# Building a boot image
depthcharge-tools-installer     depthcharge-tools-installer/progress/build_image        note
# Checking ChromeOS kernel partitions
depthcharge-tools-installer     depthcharge-tools-installer/progress/check_parts        note
# Installing tools to manage ChromeOS boot images
depthcharge-tools-installer     depthcharge-tools-installer/progress/install_tools      note
# Updating initramfs
depthcharge-tools-installer     depthcharge-tools-installer/progress/update_initramfs   note
# Writing the boot image to disk
depthcharge-tools-installer     depthcharge-tools-installer/progress/write_image        note
# Are you sure you want to exit now?
d-i     di-utils-reboot/really_reboot   boolean false
# Interactive shell
d-i     di-utils-shell/do-shell note
# for internal use; can be preseeded
d-i     directfb/hw-accel       boolean false
# No partitionable media
disk-detect     disk-detect/cannot_find error
# Driver needed for your disk drive:
# Choices: continue with no disk drive, , none of the above
disk-detect     disk-detect/module_select       select  continue with no disk drive
# for internal use; can be preseeded
disk-detect     disk-detect/multipath/enable    boolean false
# Dummy template for preseeding unavailable questions
unknown encfs/security-information      string  true
# for internal use
d-i     espeakup/card   string
# for internal use
d-i     espeakup/voice  string
# Ethernet card not found
ethdetect       ethdetect/cannot_find   error
# Driver needed by your Ethernet card:
# Choices: no ethernet card, , none of the above
ethdetect       ethdetect/module_select select  no ethernet card
# for internal use; can be preseeded
ethdetect       ethdetect/prompt_missing_firmware       boolean true
# Do you intend to use FireWire Ethernet?
ethdetect       ethdetect/use_firewire_ethernet boolean false
# for internal use; can be preseeded
finish-install  finish-install/keep-consoles    boolean false
# Installation complete
finish-install  finish-install/reboot_in_progress       note
# GRUB installation failed
grub-installer  grub-installer/apt-install-failed       error
# Device for boot loader installation:
grub-installer  grub-installer/bootdev  string
# Device for boot loader installation:
# Choices: Enter device manually, /dev/sda  (ata-VBOX_HARDDISK_VB1aab07cc-30ab544c)
grub-installer  grub-installer/choose_bootdev   select  /dev/sda
# Run os-prober automatically to detect and boot other OSes?
grub-installer  grub-installer/enable_os_prober_otheros_no      boolean false
# Run os-prober automatically to detect and boot other OSes?
grub-installer  grub-installer/enable_os_prober_otheros_yes     boolean true
# Force GRUB installation to the EFI removable media path?
grub-installer  grub-installer/force-efi-extra-removable        boolean false
# Unable to install GRUB in
grub-installer  grub-installer/grub-install-failed      error
# for internal use; can be preseeded
grub-installer  grub-installer/grub2_instead_of_grub_legacy     boolean true
# Install GRUB?
grub-installer  grub-installer/grub_not_mature_on_this_platform boolean false
# for internal use; can be preseeded
grub-installer  grub-installer/make_active      boolean true
# Failed to mount /target/proc
grub-installer  grub-installer/mounterr error
# Install the GRUB boot loader to the multipath device?
grub-installer  grub-installer/multipath        boolean true
# Unable to configure GRUB
grub-installer  grub-installer/multipath-error  error
# Install the GRUB boot loader to your primary drive?
grub-installer  grub-installer/only_debian      boolean true
# Password input error
grub-installer  grub-installer/password-mismatch        error
# for internal use; can be preseeded
grub-installer  grub-installer/skip     boolean false
# Unable to configure GRUB
grub-installer  grub-installer/update-grub-failed       error
# Update NVRAM variables to automatically boot into Debian?
grub-installer  grub-installer/update-nvram     boolean true
# Install the GRUB boot loader to your primary drive?
grub-installer  grub-installer/with_other_os    boolean true
# for internal use; can be preseeded
d-i     hw-detect/load-ide      boolean false
# Load missing firmware from removable media?
d-i     hw-detect/load_firmware boolean true
# Load missing drivers from removable media?
d-i     hw-detect/load_media    boolean false
# Error while running ''
d-i     hw-detect/modprobe_error        error
# PCMCIA resource range options:
d-i     hw-detect/pcmcia_resources      string
# Additional parameters for module :
d-i     hw-detect/retry_params  string
# Modules to load:
# Choices: usb-storage (USB storage)
d-i     hw-detect/select_modules        multiselect     usb-storage (USB storage)
# Start PC card services?
d-i     hw-detect/start_pcmcia  boolean true
# Key to function as AltGr:
# Choices: The default for the keyboard layout, No AltGr key, Right Alt (AltGr), Right Control, Right Logo key, Menu key, Left Alt, Left Logo key, Keypad Enter key, Both Logo keys, Both Alt keys
d-i     keyboard-configuration/altgr    select  The default for the keyboard layout
# Compose key:
# Choices: No compose key, Right Alt (AltGr), Right Control, Right Logo key, Menu key, Left Logo key, Caps Lock
d-i     keyboard-configuration/compose  select  No compose key
# Use Control+Alt+Backspace to terminate the X server?
d-i     keyboard-configuration/ctrl_alt_bksp    boolean false
# Country of origin for the keyboard:
# Choices:
d-i     keyboard-configuration/layout   select
# for internal use
d-i     keyboard-configuration/layoutcode       string  us
# Keyboard model:
# Choices:
d-i     keyboard-configuration/model    select
# for internal use
d-i     keyboard-configuration/modelcode        string  pc105
# for internal use
d-i     keyboard-configuration/optionscode      string
# for internal use
d-i     keyboard-configuration/store_defaults_in_debconf_db     boolean true
# Method for temporarily toggling between national and Latin input:
# Choices: No temporary switch, Both Logo keys, Right Alt (AltGr), Right Logo key, Left Alt, Left Logo key
d-i     keyboard-configuration/switch   select  No temporary switch
# Method for toggling between national and Latin mode:
# Choices: Caps Lock, Right Alt (AltGr), Right Control, Right Shift, Right Logo key, Menu key, Alt+Shift, Control+Shift, Control+Alt, Alt+Caps Lock, Left Control+Left Shift, Left Alt, Left Control, Left Shift, Left Logo key, Scroll Lock key, No toggling
d-i     keyboard-configuration/toggle   select  No toggling
# Keep the current keyboard layout in the configuration file?
d-i     keyboard-configuration/unsupported_config_layout        boolean true
# Keep current keyboard options in the configuration file?
d-i     keyboard-configuration/unsupported_config_options       boolean true
# Keep default keyboard layout ()?
d-i     keyboard-configuration/unsupported_layout       boolean true
# Keep default keyboard options ()?
d-i     keyboard-configuration/unsupported_options      boolean true
# Keyboard layout:
# Choices:
d-i     keyboard-configuration/variant  select
# for internal use
d-i     keyboard-configuration/variantcode      string
# Keymap to use:
# Choices: American English, Albanian, Arabic, Asturian, Bangladesh, Belarusian, Bengali, Belgian, Berber (Latin), Bosnian, Brazilian, British English, Bulgarian (BDS layout), Bulgarian (phonetic layout), Burmese, Canadian French, Canadian Multilingual, Catalan, Chinese, Croatian, Czech, Danish, Dutch, Dvorak, Dzongkha, Esperanto, Estonian, Ethiopian, Finnish, French, Georgian, German, Greek, Gujarati, Gurmukhi, Hebrew, Hindi, Hungarian, Icelandic, Irish, Italian, Japanese, Kannada, Kazakh, Khmer, Kirghiz, Korean, Kurdish (F layout), Kurdish (Q layout), Lao, Latin American, Latvian, Lithuanian, Macedonian, Malayalam, Nepali, Northern Sami, Norwegian, Persian, Philippines, Polish, Portuguese, Punjabi, Romanian, Russian, Serbian (Cyrillic), Sindhi, Sinhala, Slovak, Slovenian, Spanish, Swedish, Swiss French, Swiss German, Tajik, Tamil, Telugu, Thai, Tibetan, Turkish (F layout), Turkish (Q layout), Ukrainian, Uyghur, Vietnamese
d-i     keyboard-configuration/xkb-keymap       select  us
# Dummy template for preseeding unavailable questions
unknown kismet-capture-common/install-setuid    string  true
# Dummy template for preseeding unavailable questions
unknown kismet-capture-common/install-users     string
#
# Choices: Africa, Antarctica, Asia, Atlantic Ocean, Caribbean, Central America, Europe, Indian Ocean, North America, Oceania, South America
d-i     localechooser/continentlist     select
#
# Choices: Algeria, Angola, Benin, Botswana, Burkina Faso, Burundi, Cabo Verde, Cameroon, Central African Republic, Chad, Congo, Congo\, The Democratic Republic of the, Côte d'Ivoire, Djibouti, Egypt, Equatorial Guinea, Eritrea, Eswatini, Ethiopia, Gabon, Gambia, Ghana, Guinea, Guinea-Bissau, Kenya, Lesotho, Liberia, Libya, Malawi, Mali, Mauritania, Morocco, Mozambique, Namibia, Niger, Nigeria, Rwanda, Sao Tome and Principe, Senegal, Sierra Leone, Somalia, South Africa, South Sudan, Sudan, Tanzania, Togo, Tunisia, Uganda, Western Sahara, Zambia, Zimbabwe
d-i     localechooser/countrylist/Africa        select
#
# Choices: Antarctica
d-i     localechooser/countrylist/Antarctica    select
#
# Choices: Afghanistan, Bahrain, Bangladesh, Bhutan, Brunei Darussalam, Cambodia, China, Hong Kong, India, Indonesia, Iran, Iraq, Israel, Japan, Jordan, Kazakhstan, Kuwait, Kyrgyzstan, Laos, Lebanon, Macao, Malaysia, Mongolia, Myanmar, Nepal, North Korea, Oman, Pakistan, Palestine\, State of, Philippines, Qatar, Saudi Arabia, Singapore, South Korea, Sri Lanka, Syria, Taiwan, Tajikistan, Thailand, Timor-Leste, Turkmenistan, Türkiye, United Arab Emirates, Uzbekistan, Vietnam, Yemen
d-i     localechooser/countrylist/Asia  select
#
# Choices: Bouvet Island, Falkland Islands (Malvinas), Saint Helena\, Ascension and Tristan da Cunha, South Georgia and the South Sandwich Islands
d-i     localechooser/countrylist/Atlantic_Ocean        select
#
# Choices: Anguilla, Antigua and Barbuda, Aruba, Bahamas, Barbados, Bermuda, Bonaire\, Sint Eustatius and Saba, Cayman Islands, Cuba, Curaçao, Dominica, Dominican Republic, Grenada, Guadeloupe, Haiti, Jamaica, Martinique, Montserrat, Puerto Rico, Saint Barthélemy, Saint Kitts and Nevis, Saint Lucia, Saint Martin (French part), Saint Vincent and the Grenadines, Sint Maarten (Dutch part), Trinidad and Tobago, Turks and Caicos Islands, Virgin Islands\, British, Virgin Islands\, U.S.
d-i     localechooser/countrylist/Caribbean     select
#
# Choices: Belize, Costa Rica, El Salvador, Guatemala, Honduras, Nicaragua, Panama
d-i     localechooser/countrylist/Central_America       select
#
# Choices: Albania, Andorra, Armenia, Austria, Azerbaijan, Belarus, Belgium, Bosnia and Herzegovina, Bulgaria, Croatia, Cyprus, Czechia, Denmark, Estonia, Faroe Islands, Finland, France, Georgia, Germany, Gibraltar, Greece, Greenland, Guernsey, Holy See (Vatican City State), Hungary, Iceland, Ireland, Isle of Man, Italy, Jersey, Latvia, Liechtenstein, Lithuania, Luxembourg, Malta, Moldova, Monaco, Montenegro, Netherlands, North Macedonia, Norway, Poland, Portugal, Romania, Russian Federation, San Marino, Serbia, Slovakia, Slovenia, Spain, Svalbard and Jan Mayen, Sweden, Switzerland, Ukraine, United Kingdom, Åland Islands
d-i     localechooser/countrylist/Europe        select
#
# Choices: British Indian Ocean Territory, Christmas Island, Cocos (Keeling) Islands, Comoros, French Southern Territories, Heard Island and McDonald Islands, Madagascar, Maldives, Mauritius, Mayotte, Réunion, Seychelles
d-i     localechooser/countrylist/Indian_Ocean  select
#
# Choices: Canada, Mexico, Saint Pierre and Miquelon, United States
d-i     localechooser/countrylist/North_America select
#
# Choices: American Samoa, Australia, Cook Islands, Fiji, French Polynesia, Guam, Kiribati, Marshall Islands, Micronesia\, Federated States of, Nauru, New Caledonia, New Zealand, Niue, Norfolk Island, Northern Mariana Islands, Palau, Papua New Guinea, Pitcairn, Samoa, Solomon Islands, Tokelau, Tonga, Tuvalu, United States Minor Outlying Islands, Vanuatu, Wallis and Futuna
d-i     localechooser/countrylist/Oceania       select
#
# Choices: Argentina, Bolivia, Brazil, Chile, Colombia, Ecuador, French Guiana, Guyana, Paraguay, Peru, Suriname, Uruguay, Venezuela
d-i     localechooser/countrylist/South_America select
# locale
d-i     localechooser/help/locale       note
# Language:
# Choices: C${!TAB}-${!TAB}No localization, Albanian${!TAB}-${!TAB}Shqip, Amharic${!TAB}-${!TAB}አማርኛ, Arabic${!TAB}-${!TAB}عربي, Asturian${!TAB}-${!TAB}Asturianu, Bangla${!TAB}-${!TAB}বল, Basque${!TAB}-${!TAB}Euskara, Belarusian${!TAB}-${!TAB}Беларуская, Bosnian${!TAB}-${!TAB}Bosanski, Bulgarian${!TAB}-${!TAB}Български, Burmese${!TAB}-${!TAB}မနမစ, Catalan${!TAB}-${!TAB}Català, Chinese (Simplified)${!TAB}-${!TAB}中文(简体), Chinese (Traditional)${!TAB}-${!TAB}中文(繁體), Croatian${!TAB}-${!TAB}Hrvatski, Czech${!TAB}-${!TAB}Čeština, Danish${!TAB}-${!TAB}Dansk, Dutch${!TAB}-${!TAB}Nederlands, Dzongkha${!TAB}-${!TAB}རང་ཁ།, English${!TAB}-${!TAB}English, Esperanto${!TAB}-${!TAB}Esperanto, Estonian${!TAB}-${!TAB}Eesti, Finnish${!TAB}-${!TAB}Suomi, French${!TAB}-${!TAB}Français, Galician${!TAB}-${!TAB}Galego, Georgian${!TAB}-${!TAB}ქართული, German${!TAB}-${!TAB}Deutsch, Greek${!TAB}-${!TAB}Ελληνικά, Gujarati${!TAB}-${!TAB}ગજરત, Hebrew${!TAB}-${!TAB}עברית, Hindi${!TAB}-${!TAB}हनद , Hungarian${!TAB}-${!TAB}Magyar, Icelandic${!TAB}-${!TAB}Íslenska, Indonesian${!TAB}-${!TAB}Bahasa Indonesia, Irish${!TAB}-${!TAB}Gaeilge, Italian${!TAB}-${!TAB}Italiano, Japanese${!TAB}-${!TAB}日本語, Kabyle${!TAB}-${!TAB}Taqbaylit, Kannada${!TAB}-${!TAB}ಕನನಡ, Kazakh${!TAB}-${!TAB}Қазақ, Khmer${!TAB}-${!TAB}ខមរ, Korean${!TAB}-${!TAB}한국어, Kurdish${!TAB}-${!TAB}Kurdî, Lao${!TAB}-${!TAB}ລາວ, Latvian${!TAB}-${!TAB}Latviski, Lithuanian${!TAB}-${!TAB}Lietuviškai, Macedonian${!TAB}-${!TAB}Македонски, Malayalam${!TAB}-${!TAB}മലയള, Marathi${!TAB}-${!TAB}मरठ, Nepali${!TAB}-${!TAB}नपल , Northern Sami${!TAB}-${!TAB}Sámegillii, Norwegian Bokmaal${!TAB}-${!TAB}Norsk bokmål, Norwegian Nynorsk${!TAB}-${!TAB}Norsk nynorsk, Occitan${!TAB}-${!TAB}Occitan, Persian${!TAB}-${!TAB}فارسی, Polish${!TAB}-${!TAB}Polski, Portuguese${!TAB}-${!TAB}Português, Portuguese (Brazil)${!TAB}-${!TAB}Português do Brasil, Punjabi (Gurmukhi)${!TAB}-${!TAB}ਪਜਬ, Romanian${!TAB}-${!TAB}Română, Russian${!TAB}-${!TAB}Русский, Serbian (Cyrillic)${!TAB}-${!TAB}Српски, Sinhala${!TAB}-${!TAB}සහල, Slovak${!TAB}-${!TAB}Slovenčina, Slovenian${!TAB}-${!TAB}Slovenščina, Spanish${!TAB}-${!TAB}Español, Swedish${!TAB}-${!TAB}Svenska, Tagalog${!TAB}-${!TAB}Tagalog, Tajik${!TAB}-${!TAB}Тоҷикӣ, Tamil${!TAB}-${!TAB}தமழ, Telugu${!TAB}-${!TAB}తలగ, Thai${!TAB}-${!TAB}ภาษาไทย, Tibetan${!TAB}-${!TAB}བད་ཡག, Turkish${!TAB}-${!TAB}Türkçe, Ukrainian${!TAB}-${!TAB}Українська, Uyghur${!TAB}-${!TAB}ئۇيغۇرچە, Vietnamese${!TAB}-${!TAB}Tiếng Việt, Welsh${!TAB}-${!TAB}Cymraeg
d-i     localechooser/languagelist      select  en
# Country to base default locale settings on:
# Choices: Antigua and Barbuda${!TAB}-${!TAB}en_AG, Australia${!TAB}-${!TAB}en_AU.UTF-8, Botswana${!TAB}-${!TAB}en_BW.UTF-8, Canada${!TAB}-${!TAB}en_CA.UTF-8, Hong Kong${!TAB}-${!TAB}en_HK.UTF-8, India${!TAB}-${!TAB}en_IN, Ireland${!TAB}-${!TAB}en_IE.UTF-8, Israel${!TAB}-${!TAB}en_IL, New Zealand${!TAB}-${!TAB}en_NZ.UTF-8, Nigeria${!TAB}-${!TAB}en_NG, Philippines${!TAB}-${!TAB}en_PH.UTF-8, Seychelles${!TAB}-${!TAB}en_SC.UTF-8, Singapore${!TAB}-${!TAB}en_SG.UTF-8, South Africa${!TAB}-${!TAB}en_ZA.UTF-8, United Kingdom${!TAB}-${!TAB}en_GB.UTF-8, United States${!TAB}-${!TAB}en_US.UTF-8, Zambia${!TAB}-${!TAB}en_ZM, Zimbabwe${!TAB}-${!TAB}en_ZW.UTF-8
d-i     localechooser/preferred-locale  select  en_US.UTF-8
# Country, territory or area:
# Choices: Antigua and Barbuda, Australia, Botswana, Canada, Hong Kong, India, Ireland, Israel, New Zealand, Nigeria, Philippines, Seychelles, Singapore, South Africa, United Kingdom, United States, Zambia, Zimbabwe, other
d-i     localechooser/shortlist select  US
#
# Choices: Syria, Jordan, United Arab Emirates, Bahrain, Algeria, Saudi Arabia, Sudan, Iraq, Kuwait, Morocco, India, Yemen, Tunisia, South Sudan, Oman, Qatar, Lebanon, Libya, Egypt, other
d-i     localechooser/shortlist/ar      select
#
# Choices: Bangladesh, India, other
d-i     localechooser/shortlist/bn      select
#
# Choices: China, India, other
d-i     localechooser/shortlist/bo      select
#
# Choices: Andorra, Spain, France, Italy, other
d-i     localechooser/shortlist/ca      select
#
# Choices: Belgium, Germany, Italy, Liechtenstein, Luxembourg, Switzerland, Austria, other
d-i     localechooser/shortlist/de      select
#
# Choices: Greece, Cyprus, other
d-i     localechooser/shortlist/el      select
#
# Choices: Antigua and Barbuda, Australia, Botswana, Canada, Hong Kong, India, Ireland, Israel, New Zealand, Nigeria, Philippines, Seychelles, Singapore, South Africa, United Kingdom, United States, Zambia, Zimbabwe, other
d-i     localechooser/shortlist/en      select
#
# Choices: Argentina, Bolivia, Chile, Colombia, Costa Rica, Cuba, Ecuador, El Salvador, Spain, United States, Guatemala, Honduras, Mexico, Nicaragua, Panama, Paraguay, Peru, Puerto Rico, Dominican Republic, Uruguay, Venezuela, other
d-i     localechooser/shortlist/es      select
#
# Choices: Spain, France, other
d-i     localechooser/shortlist/eu      select
#
# Choices: Belgium, Canada, France, Luxembourg, Switzerland, other
d-i     localechooser/shortlist/fr      select
#
# Choices: Italy, Switzerland, other
d-i     localechooser/shortlist/it      select
#
# Choices: Aruba, Belgium, Netherlands, other
d-i     localechooser/shortlist/nl      select
#
# Choices: Pakistan, India, other
d-i     localechooser/shortlist/pa      select
#
# Choices: Brazil, Portugal, other
d-i     localechooser/shortlist/pt      select
#
# Choices: Brazil, Portugal, other
d-i     localechooser/shortlist/pt_BR   select
#
# Choices: Russian Federation, Ukraine, other
d-i     localechooser/shortlist/ru      select
#
# Choices: North Macedonia, Albania, other
d-i     localechooser/shortlist/sq      select
#
# Choices: Serbia, Montenegro, other
d-i     localechooser/shortlist/sr      select
#
# Choices: Finland, Sweden, other
d-i     localechooser/shortlist/sv      select
#
# Choices: India, Sri Lanka, other
d-i     localechooser/shortlist/ta      select
#
# Choices: Cyprus, Türkiye, other
d-i     localechooser/shortlist/tr      select
#
# Choices: China, Taiwan, Singapore, Hong Kong, other
d-i     localechooser/shortlist/zh_CN   select
#
# Choices: China, Singapore, Taiwan, Hong Kong, other
d-i     localechooser/shortlist/zh_TW   select
# Additional locales:
# Choices: aa_DJ.UTF-8, aa_DJ, aa_ER, aa_ER@saaho, aa_ET, af_ZA.UTF-8, af_ZA, agr_PE, ak_GH, am_ET, an_ES.UTF-8, an_ES, anp_IN, ar_AE.UTF-8, ar_AE, ar_BH.UTF-8, ar_BH, ar_DZ.UTF-8, ar_DZ, ar_EG.UTF-8, ar_EG, ar_IN, ar_IQ.UTF-8, ar_IQ, ar_JO.UTF-8, ar_JO, ar_KW.UTF-8, ar_KW, ar_LB.UTF-8, ar_LB, ar_LY.UTF-8, ar_LY, ar_MA.UTF-8, ar_MA, ar_OM.UTF-8, ar_OM, ar_QA.UTF-8, ar_QA, ar_SA.UTF-8, ar_SA, ar_SD.UTF-8, ar_SD, ar_SS, ar_SY.UTF-8, ar_SY, ar_TN.UTF-8, ar_TN, ar_YE.UTF-8, ar_YE, ayc_PE, az_AZ, az_IR, as_IN, ast_ES.UTF-8, ast_ES, be_BY.UTF-8, be_BY, be_BY@latin, bem_ZM, ber_DZ, ber_MA, bg_BG.UTF-8, bg_BG, bhb_IN.UTF-8, bho_IN, bho_NP, bi_VU, bn_BD, bn_IN, bo_CN, bo_IN, br_FR.UTF-8, br_FR, br_FR@euro, brx_IN, bs_BA.UTF-8, bs_BA, byn_ER, C.UTF-8, ca_AD.UTF-8, ca_AD, ca_ES.UTF-8, ca_ES, ca_ES@euro, ca_ES@valencia, ca_FR.UTF-8, ca_FR, ca_IT.UTF-8, ca_IT, ce_RU, chr_US, ckb_IQ, cmn_TW, crh_UA, cs_CZ.UTF-8, cs_CZ, csb_PL, cv_RU, cy_GB.UTF-8, cy_GB, da_DK.UTF-8, da_DK, de_AT.UTF-8, de_AT, de_AT@euro, de_BE.UTF-8, de_BE, de_BE@euro, de_CH.UTF-8, de_CH, de_DE.UTF-8, de_DE, de_DE@euro, de_IT.UTF-8, de_IT, de_LI.UTF-8, de_LU.UTF-8, de_LU, de_LU@euro, doi_IN, dsb_DE, dv_MV, dz_BT, el_GR.UTF-8, el_GR, el_GR@euro, el_CY.UTF-8, el_CY, en_AG, en_AU.UTF-8, en_AU, en_BW.UTF-8, en_BW, en_CA.UTF-8, en_CA, en_DK.UTF-8, en_DK.ISO-8859-15, en_DK, en_GB.UTF-8, en_GB, en_GB.ISO-8859-15, en_HK.UTF-8, en_HK, en_IE.UTF-8, en_IE, en_IE@euro, en_IL, en_IN, en_NG, en_NZ.UTF-8, en_NZ, en_PH.UTF-8, en_PH, en_SC.UTF-8, en_SG.UTF-8, en_SG, en_US, en_US.ISO-8859-15, en_ZA.UTF-8, en_ZA, en_ZM, en_ZW.UTF-8, en_ZW, eo, es_AR.UTF-8, es_AR, es_BO.UTF-8, es_BO, es_CL.UTF-8, es_CL, es_CO.UTF-8, es_CO, es_CR.UTF-8, es_CR, es_CU, es_DO.UTF-8, es_DO, es_EC.UTF-8, es_EC, es_ES.UTF-8, es_ES, es_ES@euro, es_GT.UTF-8, es_GT, es_HN.UTF-8, es_HN, es_MX.UTF-8, es_MX, es_NI.UTF-8, es_NI, es_PA.UTF-8, es_PA, es_PE.UTF-8, es_PE, es_PR.UTF-8, es_PR, es_PY.UTF-8, es_PY, es_SV.UTF-8, es_SV, es_US.UTF-8, es_US, es_UY.UTF-8, es_UY, es_VE.UTF-8, es_VE, et_EE.UTF-8, et_EE, et_EE.ISO-8859-15, eu_ES.UTF-8, eu_ES, eu_ES@euro, eu_FR.UTF-8, eu_FR, eu_FR@euro, fa_IR, ff_SN, fi_FI.UTF-8, fi_FI, fi_FI@euro, fil_PH, fo_FO.UTF-8, fo_FO, fr_BE.UTF-8, fr_BE, fr_BE@euro, fr_CA.UTF-8, fr_CA, fr_CH.UTF-8, fr_CH, fr_FR.UTF-8, fr_FR, fr_FR@euro, fr_LU.UTF-8, fr_LU, fr_LU@euro, fur_IT, fy_NL, fy_DE, ga_IE.UTF-8, ga_IE, ga_IE@euro, gd_GB.UTF-8, gd_GB, gez_ER, gez_ER@abegede, gez_ET, gez_ET@abegede, gl_ES.UTF-8, gl_ES, gl_ES@euro, gu_IN, gv_GB.UTF-8, gv_GB, ha_NG, hak_TW, he_IL.UTF-8, he_IL, hi_IN, hif_FJ, hne_IN, hr_HR.UTF-8, hr_HR, hsb_DE.UTF-8, hsb_DE, ht_HT, hu_HU.UTF-8, hu_HU, hy_AM, hy_AM.ARMSCII-8, ia_FR, id_ID.UTF-8, id_ID, ig_NG, ik_CA, is_IS.UTF-8, is_IS, it_CH.UTF-8, it_CH, it_IT.UTF-8, it_IT, it_IT@euro, iu_CA, ja_JP.UTF-8, ja_JP.EUC-JP, ka_GE.UTF-8, ka_GE, kab_DZ, kk_KZ.UTF-8, kk_KZ, kk_KZ.RK1048, kl_GL.UTF-8, kl_GL, km_KH, kn_IN, ko_KR.UTF-8, ko_KR.EUC-KR, kok_IN, ks_IN, ks_IN@devanagari, ku_TR.UTF-8, ku_TR, kw_GB.UTF-8, kw_GB, ky_KG, lb_LU, lg_UG.UTF-8, lg_UG, li_BE, li_NL, lij_IT, ln_CD, lo_LA, lt_LT.UTF-8, lt_LT, lv_LV.UTF-8, lv_LV, lzh_TW, mag_IN, mai_IN, mai_NP, mfe_MU, mg_MG.UTF-8, mg_MG, mhr_RU, mi_NZ.UTF-8, mi_NZ, miq_NI, mjw_IN, mk_MK.UTF-8, mk_MK, ml_IN, mn_MN, mni_IN, mnw_MM, mr_IN, ms_MY.UTF-8, ms_MY, mt_MT.UTF-8, mt_MT, my_MM, nan_TW, nan_TW@latin, nb_NO.UTF-8, nb_NO, nds_DE, nds_NL, ne_NP, nhn_MX, niu_NU, niu_NZ, nl_AW, nl_BE.UTF-8, nl_BE, nl_BE@euro, nl_NL.UTF-8, nl_NL, nl_NL@euro, nn_NO.UTF-8, nn_NO, nr_ZA, nso_ZA, oc_FR.UTF-8, oc_FR, om_ET, om_KE.UTF-8, om_KE, or_IN, os_RU, pa_IN, pa_PK, pap_AW, pap_CW, pl_PL.UTF-8, pl_PL, ps_AF, pt_BR.UTF-8, pt_BR, pt_PT.UTF-8, pt_PT, pt_PT@euro, quz_PE, raj_IN, rif_MA, ro_RO.UTF-8, ro_RO, ru_RU.UTF-8, ru_RU.KOI8-R, ru_RU, ru_RU.CP1251, ru_UA.UTF-8, ru_UA, rw_RW, sa_IN, sah_RU, sat_IN, sc_IT, sd_IN, sd_IN@devanagari, se_NO, sgs_LT, shn_MM, shs_CA, si_LK, sid_ET, sk_SK.UTF-8, sk_SK, sl_SI.UTF-8, sl_SI, sm_WS, so_DJ.UTF-8, so_DJ, so_ET, so_KE.UTF-8, so_KE, so_SO.UTF-8, so_SO, sq_AL.UTF-8, sq_AL, sq_MK, sr_ME, sr_RS, sr_RS@latin, ss_ZA, st_ZA.UTF-8, st_ZA, sv_FI.UTF-8, sv_FI, sv_FI@euro, sv_SE.UTF-8, sv_SE, sv_SE.ISO-8859-15, sw_KE, sw_TZ, syr, szl_PL, ta_IN, ta_LK, tcy_IN.UTF-8, te_IN, tg_TJ.UTF-8, tg_TJ, th_TH.UTF-8, th_TH, the_NP, ti_ER, ti_ET, tig_ER, tk_TM, tl_PH.UTF-8, tl_PH, tn_ZA, to_TO, tpi_PG, tr_CY.UTF-8, tr_CY, tr_TR.UTF-8, tr_TR, ts_ZA, tt_RU, tt_RU@iqtelif, ug_CN, uk_UA.UTF-8, uk_UA, unm_US, ur_IN, ur_PK, uz_UZ.UTF-8, uz_UZ, uz_UZ@cyrillic, ve_ZA, vi_VN, wa_BE.UTF-8, wa_BE, wa_BE@euro, wae_CH, wal_ET, wo_SN, xh_ZA.UTF-8, xh_ZA, yi_US.UTF-8, yi_US, yo_NG, yue_HK, yuw_PG, zh_CN.UTF-8, zh_CN.GB18030, zh_CN.GBK, zh_CN, zh_HK.UTF-8, zh_HK, zh_SG.UTF-8, zh_SG.GBK, zh_SG, zh_TW.UTF-8, zh_TW.EUC-TW, zh_TW, zu_ZA.UTF-8, zu_ZA
d-i     localechooser/supported-locales multiselect
# Language selection no longer possible
d-i     localechooser/translation/no-select     note
# Translations temporarily not available
d-i     localechooser/translation/none-yet      note
# Continue the installation in the selected language?
d-i     localechooser/translation/warn-light    boolean true
# Continue the installation in the selected language?
d-i     localechooser/translation/warn-severe   boolean false
# Insufficient memory
d-i     lowmem/insufficient     error
# Entering low memory mode
d-i     lowmem/low      note
# Dummy template for preseeding unavailable questions
unknown macchanger/automatically_run    string  false
# Bad archive mirror
choose-mirror-bin       mirror/bad      error
# for internal use only
choose-mirror-bin       mirror/codename string  kali-rolling
unknown mirror/codename string  kali-rolling
# country code or "manual" (for internal use)
choose-mirror-bin       mirror/country  string  enter information manually
unknown mirror/country  string  enter information manually
# Debian archive mirror directory:
choose-mirror-bin       mirror/ftp/directory    string  /debian/
# Debian archive mirror hostname:
choose-mirror-bin       mirror/ftp/hostname     string  mirror
# FTP proxy information (blank for none):
choose-mirror-bin       mirror/ftp/proxy        string
# Debian archive mirror country:
# Choices: enter information manually, Argentina, Armenia, Australia, Austria, Belarus, Belgium, Brazil, Bulgaria, Cambodia, Canada, Chile, China, Costa Rica, Croatia, Czechia, Denmark, Estonia, Finland, France, Georgia, Germany, Greece, Hong Kong, Hungary, Iceland, India, Indonesia, Iran, Israel, Italy, Japan, Kazakhstan, Kenya, Latvia, Lithuania, Luxembourg, Moldova, Netherlands, New Caledonia, New Zealand, North Macedonia, Norway, Poland, Portugal, Romania, Russian Federation, Réunion, Singapore, Slovakia, Slovenia, South Africa, South Korea, Spain, Sweden, Switzerland, Taiwan, Thailand, Türkiye, Ukraine, United Kingdom, United States, Uruguay, Vietnam
choose-mirror-bin       mirror/http/countries   select  US
# Debian archive mirror directory:
choose-mirror-bin       mirror/http/directory   string  /kali
unknown mirror/http/directory   string  /kali
# Debian archive mirror hostname:
choose-mirror-bin       mirror/http/hostname    string  http.kali.org
unknown mirror/http/hostname    string  http.kali.org
# Debian archive mirror:
# Choices:
choose-mirror-bin       mirror/http/mirror      select  deb.debian.org
# HTTP proxy information (blank for none):
choose-mirror-bin       mirror/http/proxy       string
# Debian archive mirror country:
# Choices: enter information manually
choose-mirror-bin       mirror/https/countries  select  US
# Go back and try a different mirror?
choose-mirror-bin       mirror/no-default       boolean true
# Architecture not supported
choose-mirror-bin       mirror/noarch   error
# Protocol for file downloads:
# Choices:
choose-mirror-bin       mirror/protocol select  http
# Debian version to install:
# Choices:
choose-mirror-bin       mirror/suite    select  kali-rolling
unknown mirror/suite    select  kali-rolling
# for internal use; can be preseeded
d-i     mouse/device    string
# for internal use; can be preseeded
d-i     mouse/left      boolean false
# for internal use; can be preseeded
d-i     mouse/protocol  string
# Malformed IP address
netcfg  netcfg/bad_ipaddress    error
# Invalid network link detection waiting time
netcfg  netcfg/bad_link_wait_timeout    error
# Primary network interface:
# Choices:
netcfg  netcfg/choose_interface select
# Is this information correct?
netcfg  netcfg/confirm_static   boolean true
# Network autoconfiguration failed
netcfg  netcfg/dhcp_failed      note
# DHCP hostname:
netcfg  netcfg/dhcp_hostname    string
# Network configuration method:
# Choices: Retry network autoconfiguration, Retry network autoconfiguration with a DHCP hostname, Configure network manually, , Do not configure the network at this time
netcfg  netcfg/dhcp_options     select  Configure network manually
# for internal use; can be preseeded
netcfg  netcfg/dhcp_timeout     string  25
# for internal use; can be preseeded
netcfg  netcfg/dhcpv6_timeout   string  15
# for internal use; can be preseeded
netcfg  netcfg/disable_autoconfig       boolean false
# for internal use; can be preseeded (deprecated)
netcfg  netcfg/disable_dhcp     boolean false
# for internal use; can be preseeded
netcfg  netcfg/enable   boolean true
# Error
netcfg  netcfg/error    error
# Unreachable gateway
netcfg  netcfg/gateway_unreachable      error
# Domain name:
netcfg  netcfg/get_domain       string
# Gateway:
netcfg  netcfg/get_gateway      string
# Hostname:
netcfg  netcfg/get_hostname     string  kali
# IP address:
netcfg  netcfg/get_ipaddress    string
# Name server addresses:
netcfg  netcfg/get_nameservers  string
# Netmask:
netcfg  netcfg/get_netmask      string
# Point-to-point address:
netcfg  netcfg/get_pointopoint  string
# for internal use; can be preseeded
netcfg  netcfg/hostname string
# Invalid ESSID
netcfg  netcfg/invalid_essid    error
# Invalid hostname
netcfg  netcfg/invalid_hostname error
# Invalid passphrase
netcfg  netcfg/invalid_pass     error
# Invalid WEP key
netcfg  netcfg/invalid_wep      error
# Kill switch enabled on
netcfg  netcfg/kill_switch_enabled      note
# Waiting time (in seconds) for link detection:
netcfg  netcfg/link_wait_timeout        string  3
# Continue without a default route?
netcfg  netcfg/no_default_route boolean
# No DHCP client found
netcfg  netcfg/no_dhcp_client   error
# No network interfaces detected
netcfg  netcfg/no_interfaces    error
# IPv6 unsupported on point-to-point links
netcfg  netcfg/no_ipv6_pointopoint      error
# for internal use; can be preseeded
# Choices: Network Manager, ifupdown (/etc/network/interfaces), No network configuration
netcfg  netcfg/target_network_config    select  nm_config
# Auto-configure networking?
netcfg  netcfg/use_autoconfig   boolean true
# Type of wireless network:
# Choices: Infrastructure (Managed) network, Ad-hoc network (Peer to peer)
netcfg  netcfg/wireless_adhoc_managed   select  Infrastructure (Managed) network
# Wireless ESSID for :
netcfg  netcfg/wireless_essid   string
# Wireless ESSID for :
netcfg  netcfg/wireless_essid_again     string
# Wireless network type for :
# Choices: WEP/Open Network, WPA/WPA2 PSK
netcfg  netcfg/wireless_security_type   select  wpa
# Wireless network:
# Choices:  Enter ESSID manually
netcfg  netcfg/wireless_show_essids     select
# WEP key for wireless device :
netcfg  netcfg/wireless_wep     string
# WPA/WPA2 passphrase for wireless device :
netcfg  netcfg/wireless_wpa     string
# Failure of key exchange and association
netcfg  netcfg/wpa_supplicant_failed    note
# No boot loader installed
nobootloader    nobootloader/confirmation_common        note
# Setting firmware variables for automatic boot
nobootloader    nobootloader/confirmation_powerpc_chrp_pegasos  note
# Setting firmware variables for automatic boot
nobootloader    nobootloader/confirmation_powerpc_pasemi        note
# Failed to mount /target/proc
nobootloader    nobootloader/mounterr   error
# for internal use; can be preseeded
partman-auto-crypto     partman-auto-crypto/erase_disks boolean true
# Invalid input
partman-auto-lvm        partman-auto-lvm/bad_guided_size        error
#  is too big
partman-auto-lvm        partman-auto-lvm/big_guided_size        error
# Amount of volume group to use for guided partitioning:
partman-auto-lvm        partman-auto-lvm/guided_size    string  some number
# Name of the volume group for the new system:
partman-auto-lvm        partman-auto-lvm/new_vg_name    string
# Name of the volume group for the new system:
partman-auto-lvm        partman-auto-lvm/new_vg_name_exists     string
# Continue installation without /boot partition?
partman-auto-lvm        partman-auto-lvm/no_boot        boolean
# No physical volume defined in volume group
partman-auto-lvm        partman-auto-lvm/no_pv_in_vg    error
# Non-existing physical volume
partman-auto-lvm        partman-auto-lvm/no_such_pv     error
#  is too small
partman-auto-lvm        partman-auto-lvm/small_guided_size      error
# Failed to partition the selected disk
partman-auto-lvm        partman-auto-lvm/unusable_recipe        error
# Unexpected error while creating volume group
partman-auto-lvm        partman-auto-lvm/vg_create_error        error
# Volume group name already in use
partman-auto-lvm        partman-auto-lvm/vg_exists      error
# Error while setting up RAID
partman-auto-raid       partman-auto-raid/error error
# Not enough RAID partitions specified
partman-auto-raid       partman-auto-raid/notenoughparts        error
# for internal use only
partman-auto-raid       partman-auto-raid/raidnum       string
# for internal use; can be preseeded
partman-auto-raid       partman-auto-raid/recipe        string
# Partitioning method:
# Choices:
partman-auto    partman-auto/automatically_partition    select
# Failed to partition the selected disk
partman-auto    partman-auto/autopartitioning_failed    error
# for internal use; can be preseeded
partman-auto    partman-auto/cap-ram    string  1024
# Partitioning scheme:
# Choices: All files in one partition (recommended for new users), Separate /home partition, Separate /home\, /var\, and /tmp partitions
partman-auto    partman-auto/choose_recipe      select  /lib/partman/recipes/30atomic
# for internal use; can be preseeded
partman-auto    partman-auto/disk       string
# for internal use; can be preseeded
partman-auto    partman-auto/expert_recipe      string
# for internal use; can be preseeded
partman-auto    partman-auto/expert_recipe_file string
# Partitioning method:
# Choices: Guided - use entire disk, Guided - use entire disk and set up LVM, Guided - use entire disk and set up encrypted LVM, Manual
partman-auto    partman-auto/init_automatically_partition       select  50some_device__________regular
# for internal use; can be preseeded
partman-auto    partman-auto/method     string
# Failed to partition the selected disk
partman-auto    partman-auto/no_recipe  error
# Select disk to partition:
# Choices: SCSI3 (0\,0\,0) (sda) - 53.7 GB ATA VBOX HARDDISK
partman-auto    partman-auto/select_disk        select  /var/lib/partman/devices/=dev=sda
# Unusable free space
partman-auto    partman-auto/unusable_space     error
# Device in use
partman-base    partman-base/devicelocked       error
# Partition in use
partman-base    partman-base/partlocked error
# Invalid mount point
partman-basicfilesystems        partman-basicfilesystems/bad_mountpoint error
# Go back to the menu and correct this problem?
partman-basicfilesystems        partman-basicfilesystems/boot_not_ext2  boolean
# Go back to the menu and correct this problem?
partman-basicfilesystems        partman-basicfilesystems/boot_not_first_partition       boolean
# Go back to the menu and correct errors?
partman-basicfilesystems        partman-basicfilesystems/check_failed   boolean
# Label for the file system in this partition:
partman-basicfilesystems        partman-basicfilesystems/choose_label   string
# Failed to create a file system
partman-basicfilesystems        partman-basicfilesystems/create_failed  error
# Failed to create a swap space
partman-basicfilesystems        partman-basicfilesystems/create_swap_failed     error
# Mount point for this partition:
# Choices: /dos, /windows, Enter manually, Do not mount it
partman-basicfilesystems        partman-basicfilesystems/fat_mountpoint select
# Mount options:
# Choices:
partman-basicfilesystems        partman-basicfilesystems/mountoptions   multiselect
# Mount point for this partition:
# Choices: / - the root file system, /boot - static files of the boot loader, /home - user home directories, /tmp - temporary files, /usr - static data, /var - variable data, /srv - data for services provided by this system, /opt - add-on application software packages, /usr/local - local hierarchy, Enter manually, Do not mount it
partman-basicfilesystems        partman-basicfilesystems/mountpoint     select
# Mount point for this partition:
partman-basicfilesystems        partman-basicfilesystems/mountpoint_manual      string
# Do you want to return to the partitioning menu?
partman-basicfilesystems        partman-basicfilesystems/no_mount_point boolean
# Do you want to return to the partitioning menu?
partman-basicfilesystems        partman-basicfilesystems/no_swap        boolean true
# Invalid file system for this mount point
partman-basicfilesystems        partman-basicfilesystems/posix_filesystem_required      error
# Percentage of the file system blocks reserved for the super-user:
partman-basicfilesystems        partman-basicfilesystems/specify_reserved       string
# Typical usage of this partition:
# Choices:
partman-basicfilesystems        partman-basicfilesystems/specify_usage  select
# Go back to the menu and correct errors?
partman-basicfilesystems        partman-basicfilesystems/swap_check_failed      boolean
# Go back to the menu?
partman-basicmethods    partman-basicmethods/method_only        boolean
# btrfs file system not supported for /boot
partman-btrfs   partman-btrfs/btrfs_boot        error
# btrfs root file system not supported without separate /boot
partman-btrfs   partman-btrfs/btrfs_root        error
# Go back to the menu and resume partitioning?
partman-cros    partman-cros/no_cros    boolean
# Encryption for this partition:
# Choices:
partman-crypto  partman-crypto/cipher   select
# Configuration of encrypted volumes failed
partman-crypto  partman-crypto/commit_failed    error
# Write the changes to disk and configure encrypted volumes?
partman-crypto  partman-crypto/confirm  boolean false
# Keep current partition layout and configure encrypted volumes?
partman-crypto  partman-crypto/confirm_nochanges        boolean false
# Write the changes to disk and configure encrypted volumes?
d-i     partman-crypto/confirm_nooverwrite      boolean false
# No devices selected
partman-crypto  partman-crypto/create/nosel     error
# Devices to encrypt:
# Choices:
partman-crypto  partman-crypto/create/partitions        multiselect
# Encryption configuration failure
partman-crypto  partman-crypto/crypto_boot_not_possible error
# Erasing data on  failed
partman-crypto  partman-crypto/crypto_erase_failed      error
# Encryption configuration failure
partman-crypto  partman-crypto/crypto_root_needs_boot   error
# Encryption method for this partition:
# Choices:
partman-crypto  partman-crypto/crypto_type      select
# Really erase the data on ?
partman-crypto  partman-crypto/crypto_warn_erase        boolean false
# The encryption key for  is now being created.
partman-crypto  partman-crypto/entropy  entropy
# Initialisation of encrypted volume failed
partman-crypto  partman-crypto/init_failed      error
# Failed to download crypto components
partman-crypto  partman-crypto/install_udebs_failure    error
# Proceed to install crypto components despite insufficient memory?
partman-crypto  partman-crypto/install_udebs_low_mem    boolean
# Initialization vector generation algorithm for this partition:
# Choices:
partman-crypto  partman-crypto/ivalgorithm      select
# Keyfile creation failure
partman-crypto  partman-crypto/keyfile-problem  error
# Type of encryption key hash for this partition:
# Choices:
partman-crypto  partman-crypto/keyhash  select
# Key size for this partition:
# Choices:
partman-crypto  partman-crypto/keysize  select
# Type of encryption key for this partition:
# Choices:
partman-crypto  partman-crypto/keytype  select
# Encryption configuration actions
# Choices: Create encrypted volumes, Finish
partman-crypto  partman-crypto/mainmenu select
# Encryption package installation failure
partman-crypto  partman-crypto/module_package_missing   error
# No partitions to encrypt
partman-crypto  partman-crypto/nothing_to_setup note
# Required encryption options missing
partman-crypto  partman-crypto/options_missing  error
# Empty passphrase
partman-crypto  partman-crypto/passphrase-empty error
# Passphrase input error
partman-crypto  partman-crypto/passphrase-mismatch      error
# Erasing data on  failed
partman-crypto  partman-crypto/plain_erase_failed       error
# Really erase the data on ?
partman-crypto  partman-crypto/plain_warn_erase boolean false
# Required programs missing
partman-crypto  partman-crypto/tools_missing    note
# Unsafe swap space detected
partman-crypto  partman-crypto/unsafe_swap      error
# Are you sure you want to use a random key?
partman-crypto  partman-crypto/use_random_for_nonswap   boolean false
# Use weak passphrase?
partman-crypto  partman-crypto/weak_passphrase  boolean false
# Go back to the menu and resume partitioning?
partman-efi     partman-efi/no_efi      boolean
# Force UEFI installation?
partman-efi     partman-efi/non_efi_system      boolean
# EFI partition too small
partman-efi     partman-efi/too_small_efi       error
# Do you want to return to the partitioning menu?
partman-ext3    partman-ext3/bad_alignment      boolean
# Return to the menu to set the bootable flag?
partman-ext3    partman-ext3/boot_not_bootable  boolean
# Go back to the menu and correct this problem?
partman-ext3    partman-ext3/boot_not_ext2_or_ext3      boolean
# iSCSI target portal address:
partman-iscsi   partman-iscsi/login/address     string
# for internal use; can be preseeded
partman-iscsi   partman-iscsi/login/all_targets boolean false
# Empty password
partman-iscsi   partman-iscsi/login/empty_password      error
# iSCSI login failed
partman-iscsi   partman-iscsi/login/failed      error
# iSCSI target username for :
partman-iscsi   partman-iscsi/login/incoming_username   string
# No iSCSI targets discovered
partman-iscsi   partman-iscsi/login/no_targets  error
# iSCSI targets on :
# Choices:
partman-iscsi   partman-iscsi/login/targets     multiselect
# iSCSI initiator username for :
partman-iscsi   partman-iscsi/login/username    string
# iSCSI configuration actions
# Choices: Log into iSCSI targets, Finish
partman-iscsi   partman-iscsi/mainmenu  select
# Invalid logical volume or volume group name
partman-lvm     partman-lvm/badnamegiven        error
# LVM configuration failure
partman-lvm     partman-lvm/commit_failed       error
# Write the changes to disks and configure LVM?
partman-lvm     partman-lvm/confirm     boolean false
# Keep current partition layout and configure LVM?
partman-lvm     partman-lvm/confirm_nochanges   boolean false
# Write the changes to disks and configure LVM?
d-i     partman-lvm/confirm_nooverwrite boolean false
# Remove existing logical volume data?
partman-lvm     partman-lvm/device_remove_lvm   boolean false
# Unable to automatically remove LVM data
partman-lvm     partman-lvm/device_remove_lvm_span      error
# Current LVM configuration:
partman-lvm     partman-lvm/displayall  note
# Logical Volume Management
partman-lvm     partman-lvm/help        note
# Error while creating a new logical volume
partman-lvm     partman-lvm/lvcreate_error      error
# Error while creating a new logical volume
partman-lvm     partman-lvm/lvcreate_exists     error
# Logical volume name:
partman-lvm     partman-lvm/lvcreate_name       string
# No volume group found
partman-lvm     partman-lvm/lvcreate_nofreevg   error
# No logical volume name entered
partman-lvm     partman-lvm/lvcreate_nonamegiven        error
# Logical volume size:
partman-lvm     partman-lvm/lvcreate_size       string
# Volume group:
# Choices:
partman-lvm     partman-lvm/lvcreate_vgnames    select
# Error while deleting the logical volume
partman-lvm     partman-lvm/lvdelete_error      error
# Logical volume:
# Choices:
partman-lvm     partman-lvm/lvdelete_lvnames    select
# No logical volume found
partman-lvm     partman-lvm/lvdelete_nolv       error
# LVM configuration action:
# Choices:
partman-lvm     partman-lvm/mainmenu    select
# Logical Volume Manager not available
partman-lvm     partman-lvm/nolvm       error
# No usable physical volumes found
partman-lvm     partman-lvm/nopartitions        error
# Error while initializing physical volume
partman-lvm     partman-lvm/pvcreate_error      error
# Volume group name overlaps with device name
partman-lvm     partman-lvm/vgcreate_devnameused        error
# Error while creating volume group
partman-lvm     partman-lvm/vgcreate_error      error
# Volume group name:
partman-lvm     partman-lvm/vgcreate_name       string
# Volume group name already in use
partman-lvm     partman-lvm/vgcreate_nameused   error
# No volume group name entered
partman-lvm     partman-lvm/vgcreate_nonamegiven        error
# No physical volumes selected
partman-lvm     partman-lvm/vgcreate_nosel      error
# Devices for the new volume group:
# Choices:
partman-lvm     partman-lvm/vgcreate_parts      multiselect
# Really delete the volume group?
partman-lvm     partman-lvm/vgdelete_confirm    boolean true
# Error while deleting volume group
partman-lvm     partman-lvm/vgdelete_error      error
# Volume group to delete:
# Choices:
partman-lvm     partman-lvm/vgdelete_names      select
# No volume group found
partman-lvm     partman-lvm/vgdelete_novg       error
# Error while extending volume group
partman-lvm     partman-lvm/vgextend_error      error
# Volume group to extend:
# Choices:
partman-lvm     partman-lvm/vgextend_names      select
# No physical volumes selected
partman-lvm     partman-lvm/vgextend_nosel      error
# No volume group found
partman-lvm     partman-lvm/vgextend_novg       error
# Devices to add to the volume group:
# Choices:
partman-lvm     partman-lvm/vgextend_parts      multiselect
# Error while reducing volume group
partman-lvm     partman-lvm/vgreduce_error      error
# Volume group to reduce:
# Choices:
partman-lvm     partman-lvm/vgreduce_names      select
# No physical volumes selected
partman-lvm     partman-lvm/vgreduce_nosel      error
# No volume group found
partman-lvm     partman-lvm/vgreduce_novg       error
# Devices to remove from the volume group:
# Choices:
partman-lvm     partman-lvm/vgreduce_parts      multiselect
# RAID configuration failure
partman-md      partman-md/commit_failed        error
# Write the changes to the storage devices and configure RAID?
partman-md      partman-md/confirm      boolean false
# Keep current partition layout and configure RAID?
partman-md      partman-md/confirm_nochanges    boolean false
# Write the changes to the storage devices and configure RAID?
d-i     partman-md/confirm_nooverwrite  boolean false
# Software RAID device type:
# Choices: RAID0, RAID1, RAID5, RAID6, RAID10
partman-md      partman-md/createmain   select
# No software RAID devices available
partman-md      partman-md/delete_no_md error
# Failed to delete the software RAID device
partman-md      partman-md/deletefailed error
# Software RAID device to be deleted:
# Choices:
partman-md      partman-md/deletemenu   select
# Really delete this software RAID device?
partman-md      partman-md/deleteverify boolean false
# Remove existing software RAID partitions?
partman-md      partman-md/device_remove_md     boolean false
# Software RAID configuration actions
# Choices: Create MD device, Delete MD device, Finish
partman-md      partman-md/mainmenu     select
# Software RAID not available
partman-md      partman-md/nomd error
# No RAID partitions available
partman-md      partman-md/noparts      error
# Not enough RAID partitions available
partman-md      partman-md/notenoughparts       error
# Active devices for the RAID0 array:
# Choices:
partman-md      partman-md/raid0devs    multiselect
# Layout of the RAID10 array:
partman-md      partman-md/raid10layout string  n2
# Number of active devices for the RAID array:
partman-md      partman-md/raiddevcount string
# Active devices for the RAID array:
# Choices:
partman-md      partman-md/raiddevs     multiselect
# Number of spare devices for the RAID array:
partman-md      partman-md/raidsparecount       string
# Spare devices for the RAID array:
# Choices:
partman-md      partman-md/raidsparedevs        multiselect
# Invalid size
partman-partitioning    partman-partitioning/bad_new_partition_size     error
# The size entered is invalid
partman-partitioning    partman-partitioning/bad_new_size       error
# The size entered is too large
partman-partitioning    partman-partitioning/big_new_size       error
# Are you sure you want a bootable logical partition?
partman-partitioning    partman-partitioning/bootable_logical   boolean false
# Partition table type:
# Choices: aix, amiga, bsd, dvh, gpt, mac, msdos, pc98, sun, atari, loop
partman-partitioning    partman-partitioning/choose_label       select
# Create new empty partition table on this device?
partman-partitioning    partman-partitioning/confirm_new_label  boolean false
# Write previous changes to disk and continue?
partman-partitioning    partman-partitioning/confirm_resize     boolean
# Write a new empty partition table?
partman-partitioning    partman-partitioning/confirm_write_new_label    boolean false
# for internal use; can be preseeded
partman-partitioning    partman-partitioning/default_label      string
# The resize operation is impossible
partman-partitioning    partman-partitioning/impossible_resize  error
# Location for the new partition:
# Choices: Beginning, End
partman-partitioning    partman-partitioning/new_partition_place        select
# New partition size:
partman-partitioning    partman-partitioning/new_partition_size string  some number
# Type for the new partition:
# Choices: Primary, Logical
partman-partitioning    partman-partitioning/new_partition_type select
# New partition size:
partman-partitioning    partman-partitioning/new_size   string  some number
# Resize operation failure
partman-partitioning    partman-partitioning/new_size_commit_failed     error
# Flags for the new partition:
# Choices:
partman-partitioning    partman-partitioning/set_flags  multiselect
# Partition name:
partman-partitioning    partman-partitioning/set_name   string
# The size entered is too small
partman-partitioning    partman-partitioning/small_new_size     error
# Continue with partitioning?
partman-partitioning    partman-partitioning/unknown_label      boolean true
# Continue with partitioning?
partman-partitioning    partman-partitioning/unsupported_label  boolean false
# How to use this partition:
# Choices:
partman-target  partman-target/choose_method    select
# Help on partitioning
partman-target  partman-target/help     note
# Do you want to resume partitioning?
partman-target  partman-target/mount_failed     boolean true
# Separate file system not allowed here
partman-target  partman-target/must_be_on_root  error
# No root file system
partman-target  partman-target/no_root  error
# Identical labels for two file systems
partman-target  partman-target/same_label       error
# Identical mount points for two file systems
partman-target  partman-target/same_mountpoint  error
# Partition settings:
# Choices:
partman-base    partman/active_partition        select
# for internal use; can be preseeded
# Choices: cylinder, minimal, optimal
partman-base    partman/alignment       select  optimal
# Go back to the menu and correct this problem?
partman-ext3    partman/boot_not_first_partition        boolean
# This is an overview of your currently configured partitions and mount points. Select a partition to modify its settings (file system, mount point, etc.), a free space to create partitions, or a device to initialize its partition table.
# Choices: Guided partitioning, Configure software RAID, Configure the Logical Volume Manager, Configure encrypted volumes, Configure iSCSI volumes, , SCSI3 (0\,0\,0) (sda) - 53.7 GB ATA VBOX HARDDISK, >   ${!TAB}${!ALIGN=RIGHT}#1${!TAB}primary${!TAB}${!ALIGN=RIGHT}52.7 GB${!TAB}${!TAB}f${!TAB}ext4${!TAB}${!TAB}/${!TAB}, >   ${!TAB}${!ALIGN=RIGHT}#5${!TAB}logical${!TAB}${!ALIGN=RIGHT}1.0 GB${!TAB}${!TAB}f${!TAB}swap${!TAB}${!TAB}swap${!TAB}, , Undo changes to partitions, Finish partitioning and write changes to disk
partman-base    partman/choose_partition        select  90finish__________finish
# Write the changes to disks?
partman-base    partman/confirm boolean false
# Continue with the installation?
partman-base    partman/confirm_nochanges       boolean false
# Write the changes to disks?
partman-base    partman/confirm_nooverwrite     boolean false
# for internal use; can be preseeded
partman-base    partman/default_filesystem      string  ext4
# for internal use; can be preseeded
partman-base    partman/early_command   string
#
# Choices:
partman-base    partman/exception_handler       select
#
partman-base    partman/exception_handler_note  note
# How to use this free space:
# Choices:
partman-base    partman/free_space      select
# for internal use; can be preseeded
# Choices: traditional, label, uuid
partman-target  partman/mount_style     select  uuid
# The free space starts from  and ends at .
partman-base    partman/show_free_chs   note
# The partition starts from  and ends at .
partman-base    partman/show_partition_chs      note
# What to do with this device:
# Choices:
partman-base    partman/storage_device  select
# Create a normal user account now?
user-setup-udeb passwd/make-user        boolean true
# Allow login as root?
unknown passwd/root-login       boolean false
user-setup-udeb passwd/root-login       boolean false
# for internal use only
user-setup-udeb passwd/user-default-groups      string  audio cdrom dip floppy video plugdev netdev scanner bluetooth debian-tor lpadmin
# Full name for the new user:
user-setup-udeb passwd/user-fullname    string  kali
# for internal use only
user-setup-udeb passwd/user-uid string
# Username for your account:
user-setup-udeb passwd/username string  kali
# Invalid username
user-setup-udeb passwd/username-bad     error
# Reserved username
user-setup-udeb passwd/username-reserved        error
# for internal use; can be preseeded
pkgsel  pkgsel/include  string
# for internal use; can be preseeded
pkgsel  pkgsel/run_tasksel      boolean true
# Updates management on this system:
# Choices: No automatic updates, Install security updates automatically
pkgsel  pkgsel/update-policy    select  none
unknown pkgsel/update-policy    select  none
# for internal use; can be preseeded
pkgsel  pkgsel/updatedb boolean true
# for internal use; can be preseeded
# Choices: none, safe-upgrade, full-upgrade
pkgsel  pkgsel/upgrade  select  none
unknown pkgsel/upgrade  select  none
# Dummy template for preseeding unavailable questions
unknown popularity-contest/participate  string  false
# for internal use; can be preseeded
d-i     preseed/boot_command    string
# Checksum error
d-i     preseed/checksum_error  error
# Failed to run preseeded command
d-i     preseed/command_failed  error
# for internal use; can be preseeded
d-i     preseed/early_command   string  anna-install eatmydata-udeb
# for internal use; can be preseeded
d-i     preseed/file    string  file:///cdrom/simple-cdd/default.preseed
# for internal use; can be preseeded
d-i     preseed/file/checksum   string
# for internal use; can be preseeded
d-i     preseed/include string
# for internal use; can be preseeded
d-i     preseed/include/checksum        string
# for internal use; can be preseeded
d-i     preseed/include_command string
# for internal use; can be preseeded
d-i     preseed/interactive     boolean false
# for internal use; can be preseeded
d-i     preseed/late_command    string
# Failed to process the preconfiguration file
d-i     preseed/load_error      error
# Failed to retrieve the preconfiguration file
d-i     preseed/retrieve_error  error
# for internal use; can be preseeded
d-i     preseed/run     string
# for internal use; can be preseeded
d-i     preseed/run/checksum    string
# Location of initial preconfiguration file:
network-preseed preseed/url     string
# for internal use; can be preseeded
network-preseed preseed/url/checksum    string
# for internal use; can be preseeded
d-i     rescue/enable   boolean false
# Failed to copy file from installation media. Retry?
d-i     retriever/cdrom/error   boolean true
# Dummy template for preseeding unavailable questions
unknown samba-common/dhcp       string  false
# Cannot save logs
d-i     save-logs/bad_directory error
# Directory in which to save debug logs:
d-i     save-logs/directory     string  /mnt
# Failed to mount the floppy
d-i     save-logs/floppy_mount_failed   error
# Web server started
d-i     save-logs/httpd_running note
# Insert formatted floppy in drive
d-i     save-logs/insert_floppy note
# How should the debug logs be saved or transferred?
# Choices: serve over network, mounted file system, floppy
d-i     save-logs/menu  select
# Web server started, but network not running
d-i     save-logs/no_network    note
# Select profiles
# Choices: kali, kali-purple, offline
simple-cdd      simple-cdd/profiles     multiselect     kali,kali-purple,offline
unknown simple-cdd/profiles     multiselect     kali,kali-purple,offline
# Dummy template for preseeding unavailable questions
unknown sslh/inetd_or_standalone        string  standalone
# Dummy template for preseeding unavailable questions
unknown tasksel/desktop string  xfce
# Choose software to install:
# Choices: Desktop environment [selecting this item has no effect], ... Xfce (Kali's default desktop environment), ... GNOME, ... KDE Plasma, Install defensive tools by purpose [selecting this item has no effect], ... Identify -- tools to support the NIST CSF domain IDENTIFY, ... Protect -- tools to support the NIST CSF domain PROTECT, ... Detect -- tools to support the NIST CSF domain DETECT, ... Respond -- tools to support the NIST CSF domain RESPOND, ... Recover -- tools to support the NIST CSF domain RECOVER
d-i     tasksel/first   multiselect     Desktop environment [selecting this item has no effect], ... Xfce (Kali's default desktop environment), Install defensive tools by purpose [selecting this item has no effect], ... Identify -- tools to support the NIST CSF domain IDENTIFY, ... Protect -- tools to support the NIST CSF domain PROTECT, ... Detect -- tools to support the NIST CSF domain DETECT, ... Respond -- tools to support the NIST CSF domain RESPOND, ... Recover -- tools to support the NIST CSF domain RECOVER
# Select your time zone:
# Choices: Eastern, Central, Mountain, Pacific, Alaska, Hawaii, Arizona, East Indiana, Samoa
tzsetup-udeb    time/zone       select  US/Eastern
# Dummy template for preseeding unavailable questions
unknown tripwire/installed      string  true
# Dummy template for preseeding unavailable questions
unknown tripwire/rebuild-config string  false
# Dummy template for preseeding unavailable questions
unknown tripwire/rebuild-policy string  false
# Dummy template for preseeding unavailable questions
unknown tripwire/use-localkey   string  false
# Dummy template for preseeding unavailable questions
unknown tripwire/use-sitekey    string  false
# location
# Choices: McMurdo, Rothera, Palmer, Mawson, Davis, Casey, Vostok, Dumont-d'Urville, Syowa
tzsetup-udeb    tzsetup/country/AQ      select
# state
# Choices: Australian Capital Territory, New South Wales, Victoria, Northern Territory, Queensland, South Australia, Tasmania, Western Australia, Eyre Highway, Yancowinna County, Lord Howe Island
tzsetup-udeb    tzsetup/country/AU      select  Australia/Canberra
# state
# Choices: Acre, Alagoas, Amazonas, Amapá, Bahia, Ceará, Distrito Federal, Espírito Santo, Fernando de Noronha, Goiás, Maranhão, Minas Gerais, Mato Grosso do Sul, Mato Grosso, Pará, Paraíba, Pernambuco, Piauí, Paraná, Rio de Janeiro, Rio Grande do Norte, Rondônia, Roraima, Rio Grande do Sul, Santa Catarina, Sergipe, São Paulo, Tocantins
tzsetup-udeb    tzsetup/country/BR      select  America/Sao_Paulo
# zone
# Choices: Newfoundland, Atlantic, Eastern, Central, East Saskatchewan, Saskatchewan, Mountain, Pacific
tzsetup-udeb    tzsetup/country/CA      select  Canada/Eastern
# city
# Choices: Kinshasa, Lubumbashi
tzsetup-udeb    tzsetup/country/CD      select  Africa/Kinshasa
# zone
# Choices: Santiago, Easter Island
tzsetup-udeb    tzsetup/country/CL      select  America/Santiago
# zone
# Choices: Asia/Nicosia (most of Cyprus), Asia/Famagusta (Northern Cyprus)
tzsetup-udeb    tzsetup/country/CY      select
# location
# Choices: Guayaquil, Galapagos
tzsetup-udeb    tzsetup/country/EC      select  America/Guayaquil
# location
# Choices: Madrid, Ceuta, Canary Islands
tzsetup-udeb    tzsetup/country/ES      select  Europe/Madrid
# location
# Choices: Yap, Truk, Pohnpei, Kosrae
tzsetup-udeb    tzsetup/country/FM      select  Pacific/Ponape
# location
# Choices: Godthab, Danmarkshavn, Scoresbysund, Thule
tzsetup-udeb    tzsetup/country/GL      select  America/Godthab
# city
# Choices: Western (Sumatra\, Jakarta\, Java\, West and Central Kalimantan), Central (Sulawesi\, Bali\, Nusa Tenggara\, East and South Kalimantan), Eastern (Maluku\, Papua)
tzsetup-udeb    tzsetup/country/ID      select  Asia/Jakarta
# zone
# Choices: Tarawa (Gilbert Islands), Enderbury (Phoenix Islands), Kiritimati (Line Islands)
tzsetup-udeb    tzsetup/country/KI      select  Pacific/Tarawa
# city
# Choices: Almaty, Qyzylorda, Aqtobe, Atyrau, Oral
tzsetup-udeb    tzsetup/country/KZ      select  Asia/Almaty
# city
# Choices: Ulaanbaatar, Hovd, Choibalsan
tzsetup-udeb    tzsetup/country/MN      select  Asia/Ulaanbaatar
# zone
# Choices: North-West, Pacific, Sonora, Central, South-East
tzsetup-udeb    tzsetup/country/MX      select  Mexico/General
# location
# Choices: Auckland, Chatham Islands
tzsetup-udeb    tzsetup/country/NZ      select  Pacific/Auckland
# location
# Choices: Tahiti (Society Islands), Marquesas Islands, Gambier Islands
tzsetup-udeb    tzsetup/country/PF      select  Pacific/Tahiti
# zone
# Choices: Port Moresby, Bougainville
tzsetup-udeb    tzsetup/country/PG      select
# location
# Choices: Lisbon, Madeira Islands, Azores
tzsetup-udeb    tzsetup/country/PT      select  Europe/Lisbon
# zone
# Choices: Moscow-01 - Kaliningrad, Moscow+00 - Moscow, Moscow+01 - Samara, Moscow+02 - Yekaterinburg, Moscow+03 - Omsk, Moscow+04 - Krasnoyarsk, Moscow+05 - Irkutsk, Moscow+06 - Yakutsk, Moscow+07 - Vladivostok, Moscow+08 - Magadan, Moscow+09 - Kamchatka
tzsetup-udeb    tzsetup/country/RU      select  Europe/Moscow
# location
# Choices: Johnston Atoll, Midway Islands, Wake Island
tzsetup-udeb    tzsetup/country/UM      select  Pacific/Midway
# zone
# Choices: Eastern, Central, Mountain, Pacific, Alaska, Hawaii, Arizona, East Indiana, Samoa
tzsetup-udeb    tzsetup/country/US      select  US/Eastern
# Empty password
user-setup-udeb user-setup/password-empty       error
# Password input error
user-setup-udeb user-setup/password-mismatch    error
# Dummy template for preseeding unavailable questions
unknown wireshark-common/install-setuid string  true
