import libvirt
from base64 import b64decode

# Documentation:
# http://www.redhat.com/archives/libvir-list/2009-August/msg00310.html

def __get_session():
  conn = libvirt.open('qemu:///session')
  return conn

def list_secrets():
  sess = __get_session()
  secrets = sess.listSecrets()
  return secrets

def has_secret(uuid):
  sess = __get_session()
  list = list_secrets()
  if uuid in list:
    return True
  else:
    return False

# takes XML string
def define_secret_str(secret, data):
  sess = __get_session()
  s = sess.secretDefineXML(secret)
  s.setValue(b64decode(data))
  # TODO: catch failure
  return True


def create_ceph_secret(uuid, name, value):
  define_secret_str("""
    <secret ephemeral='no' private='no'>
      <uuid>%s</uuid>
      <usage type='ceph'>
        <name>%s</name>
      </usage>
    </secret>
    """ % (uuid, name), value)
  return True
