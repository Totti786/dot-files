#!/usr/bin/python3

import gi, sys
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, GLib

rec_mgr = Gtk.RecentManager.get_default()

rec_mgr.purge_items()

GLib.idle_add(Gtk.main_quit)
Gtk.main()
