import yaml
import os

file_names = ['ub_abilities', 'ha_abilities']

for file in file_names:
    # load in abilities from YAML
    with open("abilities/{}.yml".format(file)) as stream:
        try:
            abilities = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)

    # abilities is a list of dicts
    abilities = sorted(abilities, key=lambda d: d['name'])
    strings = []
    print('Reading {} abilities.'.format(len(abilities)))

    for ability in abilities:
        long_power_string = f'''\\ability%
    {{{ability['name']}}}
    {{{ability['subtitle']}}}
    {{{ability['resource']}}}
    {{{ability['range']}}}
    {{{ability['duration']}}}
    {{{ability['recharge']}}}
{ability['long_description']}
'''
        strings.append(long_power_string)

    print('Writing full list to {}.tex.'.format(file))
    with open('abilities/{}.tex'.format(file), 'a') as f:
        open('abilities/{}.tex'.format(file), 'w').close()
        for pwr in strings:
            f.write(pwr + os.linesep)