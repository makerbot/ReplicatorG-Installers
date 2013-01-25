# vim:ai:et:ff=unix:fileencoding=utf-8:sw=4:syntax=python:ts=4:
#
# Top-level SConstruct file for ReplicatorG-Installers.
#

import os
import sys

#not used, added for consistency
AddOption('--debug_build', action='store_true', dest='debug_build')
debug = GetOption('debug_build')

env = Environment(ENV = os.environ)

env.Tool('mb_install', toolpath=[Dir('submodule/mw-scons-tools')])

if env.MBIsWindows():
  env.MBInstallSystem(os.path.join('windows', 'drivers'), 'drivers')

env.MBCreateInstallTarget()