/*
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

var config = {
  // list images on console that match no model
  listMissingImages: true,
  // see devices.js for different vendor model maps
  vendormodels: vendormodels,
  // set enabled categories of devices (see devices.js)
  enabled_device_categories: [
    "recommended",
    "4_32", "8_32", "16_32",
    "ath10k_lowmem",
    "small_kernel_part",
    "legacy_target"
  ],
  // Display a checkbox that allows to display not recommended devices.
  // This only make sense if enabled_device_categories also contains not
  // recommended devices.
  recommended_toggle: true,
  // Optional link to an info page about no longer recommended devices
  recommended_info_link: null,
  // community prefix of the firmware images
  community_prefix: 'gluon-ffmwu-',
  // firmware version regex
  version_regex: '-([0-9]+.[0-9]+.[0-9]+([+][a-z0-9]+)?(~[a-z0-9]+)?)[.-]',
  // relative image paths and branch
  directories: {
    'https://firmware.freifunk-mwu.de/stable/factory/': 'stable',
    'https://firmware.freifunk-mwu.de/stable/sysupgrade/': 'stable',
    'https://firmware.freifunk-mwu.de/stable/other/': 'stable',
    'https://firmware.freifunk-mwu.de/testing/factory/': 'testing',
    'https://firmware.freifunk-mwu.de/testing/sysupgrade/': 'testing',
    'https://firmware.freifunk-mwu.de/testing/other/': 'testing',
    'https://firmware.freifunk-mwu.de/experimental/factory/': 'experimental',
    'https://firmware.freifunk-mwu.de/experimental/sysupgrade/': 'experimental',
    'https://firmware.freifunk-mwu.de/experimental/other/': 'experimental'
  },
  // page title
  title: 'Freifunk MWU: Firmware',
  // branch descriptions shown during selection
  branch_descriptions: {
    stable: 'Gut getestet, zuverlässig und stabil.',
    testing: 'Vorabtests neuer Stable-Kandidaten.',
    experimental: 'Ungetestet, automatisch generiert.'
  },
  // recommended branch will be marked during selection
  recommended_branch: 'stable',
  // experimental branches (show a warning for these branches)
  experimental_branches: ['experimental'],
  // path to preview pictures directory
  preview_pictures: 'pictures/',
  // link to changelog
  changelog: 'https://github.com/freifunk-mwu/site-ffmwu/releases'
};
