# Extras Exporter
Extras Exporter is a small exporter plugin designed to enable game developers to export additional files that live 
alongside the game binary and `*.pck` file. These extra files can be any aspect of the game distributable that should
live outside of the `*.pck` file.

The primary use case for this that I can envision is including license files that would be needed to comply with open
source licenses such as the MIT License. Because Godot itself is licensed under the MIT license, it is necessary to
include at least one license file.

## Installation
The easiest way to install this addon is to clone the repository into the `addons` folder of your game files. If you
don't have an `addons` folder, be sure to create it.

Once you have cloned the repository into the `addons` folder, you should be able to enable the plugin by going to
**Project** > **Project Settings** > **Plugins** in the Godot Editor. There you should see an entry for "Extras Exporter".
If the plugin is not already enabled, simply click the checkbox in the **Enabled** column to enable it.

## Usage
The **Extras Exporter** Plugin adds some additional options to the export menu. Go to **Project** > **Export** and 
select a target. Then, scroll to the end of the list in the **Options** tab, and you will see a heading for **Extras 
Exporter**.

Once you have configured the options to your satisfaction, simply proceed with the export as usual, and your files will
be copied to the output directory.

### Options

* **Additional Files**: An array of file paths that will be copied to the output directory of the export. Use this to
    add files to the output directory of a build so that the files are readable outside of the `*.pck` file.
* **Write Version File**: Gives you the option to write a file called `version.txt` to the output directory of the export.
    The file contains a single line which is the version of the build. The version number used is the one set in the
    project settings (`application/config/version`).
