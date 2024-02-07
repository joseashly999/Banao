from ultralytics import YOLO     #the ultralytics package contains all the required libraries and packages to train the YOLOv8 model
                                 #for object detection.

# Load a model
model = YOLO("yolov8n.yaml")  # build a new model from scratch


# Use the model
model.train(data="config.yaml", epochs=100)  # train the model

