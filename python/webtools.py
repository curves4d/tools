import os
import sys
import logging
from bs4 import BeautifulSoup as bs
import requests


class Page:
    def __init__(self, soup, url):
        self.s = soup
        self.url = url


def download(url, loc):
    headers = {'User-Agent': "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1"}
    response = requests.get(url, stream=True, headers=headers)
    dir_name = os.path.dirname(loc)
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)
    with open(loc, 'w') as out_file:
        out_file.write(response.text)
    del response


def get_soup(url, raw=False):
    resp = None
    fn = get_local_file_name(url)
    if raw or not os.path.exists(fn):
        download(url, fn)
    try:
        with open(fn, 'r') as r:
            r = r.read()
            resp = bs(r, "lxml")
    except (Exception, ConnectionResetError, ConnectionError) as e:
        logging.exception(str(e))
        logging.error("Error in getting soup for url {0}".format(url))
        resp = bs("", "lxml")
    return resp


def get_page(url, raw=False):
    try:
        soup = get_soup(url, raw=raw)
        page = Page(soup, url)
        return page
    except Exception as e:
        logging.exception(e.strerror)
        logging.error("Couldn't get soup for {0}".format(url))
        return Page(bs("", "lxml"), url)    # Return an empty soup object


def get_local_file_name(url):
    pass