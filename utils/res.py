class ResponseData:
    def __init__(self, status=2000, message=None, data=None):
        self.status = status
        self.message = message
        self.data = data

    @property
    def get_dict(self):
        return self.__dict__
