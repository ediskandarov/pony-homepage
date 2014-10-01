%define debug_package %{nil}

Name: %{_name}
Version: %{_version}
Release: %{_release}%{?dist}
Summary: %{_description}
Group: Applications/Internet
License: %{_license}
URL: %{_url}
Source0: %{_name}-%{_version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

Autoreq: 0
BuildRequires: python-devel
BuildRequires: python-setuptools
BuildRequires: python-virtualenv
BuildRequires: redhat-rpm-config
Requires: python

%description
%{_long_description}

%prep
%setup -qc

%build
python setup.py egg_info -RDb "" sdist

%install
virtualenv %{buildroot}/opt/%{_name}
%{buildroot}/opt/%{_name}/bin/python -m pip install --ignore-installed dist/%{_name}-%{_version}.tar.gz

# remove fat pip
%{buildroot}/opt/%{name}/bin/python -m pip uninstall pip --yes

# fix path
find %{buildroot}/opt/%{_name}/bin -type f\
      -exec sed -i 's:'%{buildroot}'::' {} \;

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)
/opt
