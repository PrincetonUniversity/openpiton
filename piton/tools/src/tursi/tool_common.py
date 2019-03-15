import os

DV_ROOT = os.environ['DV_ROOT']
MODEL_DIR = os.environ['MODEL_DIR']

class WorkingEnvironment:
    def __init__(self):
        self.model_dir = MODEL_DIR
        self.work_root_dir = os.path.join(MODEL_DIR, "tursi")
        self.log = os.path.join(self.work_root_dir, "logs")
        os.system('mkdir -p %s' % self.log)
