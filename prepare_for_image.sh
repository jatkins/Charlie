#!/bin/bash
# Author:		Jacob T. Atkins
# Email:		jta4j@mcs.uvawise.edu
#	Created:	12/22/2010
#
# Copyright 2010 Jacob Atkins
#
# This script will get a node of a Debian based cluster ready to be
# imaged, using udp-cast.
# It will remove udev settings for the network interfaces, update,
# upgrade, and clean apt, zero the empty space of the disk out, then
# halt the node.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
echo "" > /etc/udev/rules.d/70-persistent-net.rules
apt-get update
apt-get -y upgrade
apt-get clean
dd if=/dev/zero of=/zero.big
rm /zero.big
shutdown -h now
