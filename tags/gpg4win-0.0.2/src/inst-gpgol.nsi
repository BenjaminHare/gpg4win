# inst-gpgol.nsi - Installer snippet for gpgol.      -*- coding: latin-1; -*-
# Copyright (C) 2005 g10 Code GmbH
# 
# This file is part of GPG4Win.
# 
# GPG4Win is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# GPG4Win is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA

!ifdef prefix
!undef prefix
!endif
!define prefix ${ipdir}/gpgol-${gpg4win_pkg_gpgol_version}


Section "GPGol" SEC_gpgol
  SetOutPath "$INSTDIR"
!ifdef SOURCES
  File "${gpg4win_pkg_gpgol}"
!else
  File ${prefix}/bin/gpgol.dll

  # Register the DLL.
  Exec 'regsvr32.exe /s "$INSTDIR\gpgol.dll"'
!endif
SectionEnd


LangString DESC_SEC_gpgol ${LANG_ENGLISH} \
   "GnuPG for Outlook"
LangString DESC_SEC_gpgol ${LANG_GERMAN} \
   "GnuPG f�r Outlook (GPGol) is eine Erweiterung f�r Outlook 2000, die \
    verwendet wird um Nachrichten mit OpenPGP zu verschl�sseln."