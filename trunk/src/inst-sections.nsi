# inst-sections.nsi - Installer for GnuPG 4 Windows sections.
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

# Sections

!include "inst-gnupg.nsi"
!include "inst-libgpg-error.nsi"
!include "inst-libiconv.nsi"
!include "inst-pkgconfig.nsi"
!include "inst-zlib.nsi"
!include "inst-gpgme.nsi"
!include "inst-gettext.nsi"
!include "inst-glib.nsi"
!include "inst-libpng.nsi"
!include "inst-gpgol.nsi"
!include "inst-pango.nsi"
!include "inst-atk.nsi"
!include "inst-gtk+.nsi"
!include "inst-gpa.nsi"

# Dependency Management

!include "Sections.nsh"

Function .onSelChange
  # This section could very well be autogenerated from the
  # information in configure.ac.  Note that it doesn't hurt to have
  # stuff here for packages that we don't include.

  # First clear all indirect dependencies.
  !insertmacro UnselectSection ${SEC_libiconv}
  !insertmacro UnselectSection ${SEC_gettext}
  !insertmacro UnselectSection ${SEC_zlib}
  !insertmacro UnselectSection ${SEC_libpng}
  !insertmacro UnselectSection ${SEC_pkgconfig}
  !insertmacro UnselectSection ${SEC_glib}
  !insertmacro UnselectSection ${SEC_atk}
  !insertmacro UnselectSection ${SEC_pango}
  !insertmacro UnselectSection ${SEC_gtk_}
  !insertmacro UnselectSection ${SEC_libgpg_error}
  !insertmacro UnselectSection ${SEC_gpgme}

  # Then enable all dependencies in reverse build list order!

  !insertmacro SectionFlagIsSet ${SEC_gpa} ${SF_SELECTED} have_gpa skip_gpa
  have_gpa:
  !insertmacro SelectSection ${SEC_zlib}
  !insertmacro SelectSection ${SEC_gtk_}
  !insertmacro SelectSection ${SEC_libpng}
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_gpgme}
  !insertmacro SelectSection ${SEC_gnupg}
  skip_gpa:

  !insertmacro SectionFlagIsSet ${SEC_gtk_} \
		${SF_SELECTED} have_gtk_ skip_gtk_
  have_gtk_:
  !insertmacro SelectSection ${SEC_atk}
  !insertmacro SelectSection ${SEC_pango}
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_libiconv}
  !insertmacro SelectSection ${SEC_gettext}
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_gtk_:

  !insertmacro SectionFlagIsSet ${SEC_atk} \
		${SF_SELECTED} have_atk skip_atk
  have_atk:
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_atk:

  !insertmacro SectionFlagIsSet ${SEC_pango} \
		${SF_SELECTED} have_pango skip_pango
  have_pango:
  !insertmacro SelectSection ${SEC_glib}
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_pango:

  !insertmacro SectionFlagIsSet ${SEC_gpgol} \
		${SF_SELECTED} have_gpgol skip_gpgol
  have_gpgol:
  !insertmacro SelectSection ${SEC_gpgme}
  !insertmacro SelectSection ${SEC_gnupg}
  skip_gpgol:

  !insertmacro SectionFlagIsSet ${SEC_libpng} \
		${SF_SELECTED} have_libpng skip_libpng
  have_libpng:
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_libpng:

  !insertmacro SectionFlagIsSet ${SEC_glib} \
		${SF_SELECTED} have_glib skip_glib
  have_glib:
  !insertmacro SelectSection ${SEC_pkgconfig}
  skip_glib:

  !insertmacro SectionFlagIsSet ${SEC_gettext} \
		${SF_SELECTED} have_gettext skip_gettext
  have_gettext:
  !insertmacro SelectSection ${SEC_libiconv}
  skip_gettext:

  !insertmacro SectionFlagIsSet ${SEC_gpgme} \
		${SF_SELECTED} have_gpgme skip_gpgme
  have_gpgme:
  !insertmacro SelectSection ${SEC_libgpg_error}
  skip_gpgme:

  # Package "zlib" has no dependencies.
  # Package "pkgconfig" has no dependencies.
  # Package "libiconv" has no dependencies.
  # Package "libgpg-error" has no dependencies.
  # Package "gnupg" has no dependencies.

FunctionEnd


# This must be in a central place.  Urgs.

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_gpgol} $(DESC_SEC_gpgol)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_gpa} $(DESC_SEC_gpa)
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC_gnupg} $(DESC_SEC_gnupg)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

