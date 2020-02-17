import cx_Oracle
from sqlalchemy import create_engine
from getpass import getpass

def get_oracle_sql_engine(address, port, sid, schema):
    # Connect to service
    service = cx_Oracle.makedsn(address, port, service_name=sid)
    passwd = getpass('Enter password for %s' % schema)

    cstr = 'oracle+cx_oracle://%s:%s@%s' % (schema, passwd, service)

    # Prep the database engine
    engine = create_engine(cstr, convert_unicode=False)
    print("Engine created.")

    return engine
