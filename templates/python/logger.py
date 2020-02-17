import logging

FORMAT = '%(asctime)-15s [%(levelname)s]: %(message)s'
logging.basicConfig(format=FORMAT)
LOG = logging.getLogger('your_py_file_here')
LOG.setLevel(logging.INFO)

LOG.info("this is a test")
