# Open zombie binary file
with open("zombies/round1/ZOMA", 'rb') as binfile:
    # Create list from bytes of the file starting from 0xcd
    s = list(c for c in binfile.read())[0xcd:]
    count = 0
    # Initialize empty list
    a = [None] * len(s)
    # Fill list with inverse of the translation table in the zombie
    # The object type is a string with the hex value inside
    for thing in s:
        a[thing] = '{:02X}'.format(count)
        count += 1
    # Join list for a usable format for TASM
    a[-1] += 'h'
    print('h,0'.join(a))
