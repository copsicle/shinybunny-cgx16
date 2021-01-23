with open("zombies/round1/ZOMA", 'rb') as binfile:
    s = list('{:02X}'.format(c) for c in binfile.read())[205:]
    count = 0
    a = [None] * len(s)
    for thing in s:
        a[int(thing, 16)] = '{:02X}'.format(count)
        count += 1
    a[-1] += 'h'
    print('h,0'.join(a))