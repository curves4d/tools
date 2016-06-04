def clean_filename(loc):
    ''' This function cleans a name to comply with unix naming restrictions
    '''
    bad_chars = ['/', '\\', '*', '%', '?', ':', '|', '"', '<', '>', '.']
    for char in bad_chars:
        loc = loc.replace(char, '')
    return loc
