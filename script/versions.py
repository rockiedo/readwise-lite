from pathlib import Path


def load_version_catalog():
    versions = {}
    versions_file_path = Path(__file__).parent.joinpath('../versions.yaml')

    with(open(versions_file_path, 'r')) as f:
        lines = f.readlines()
        for line in lines:
            parts = line.split(':')
            
            if (len(parts) != 2):
                raise Exception(f'[Error] Incorrect line format {line}')

            versions[parts[0].strip()] = parts[1].strip()

    return versions


def override_versions_in_single_file(version_catalog, file_path):
    print(f'[File] {file_path}')

    lines = []
    overridden_lines = []

    with(open(file_path, 'r')) as f:
        lines = f.readlines()

    for line in lines:
        parts = line.split(':')

        if len(parts) != 2 or parts[0].strip() not in version_catalog:
            overridden_lines.append(line)
            continue

        package_name = parts[0].strip()
        package_version = version_catalog[package_name]

        print(f'\t* {package_name}: {parts[1].strip()} -> {package_version}')

        overridden_line = f'{parts[0]}: {package_version}\n'
        overridden_lines.append(overridden_line)

    with(open(file_path, 'w')) as f:
        f.writelines(overridden_lines)


def override_versions(version_catalog):
    pubspec_file_paths = Path(__file__).parent.parent.glob('**/pubspec.yaml')
    for path in pubspec_file_paths:
        override_versions_in_single_file(version_catalog, path)


if __name__ == '__main__':
    override_versions(load_version_catalog())
