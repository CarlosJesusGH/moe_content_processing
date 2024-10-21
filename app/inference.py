# Inference function
def predict_image(model, image_path, device):
    transform = transforms.Compose([
        transforms.Resize((32, 32)),
        transforms.ToTensor(),
        transforms.Normalize((0.5,), (0.5,))
    ])

    image = Image.open(image_path).convert('L')  # Convert to grayscale
    image = transform(image).unsqueeze(0)
    image = image.to(device)

    model.eval()
    with torch.no_grad():
        output = model(image)
        _, predicted = output.max(1)

    return predicted.item()

# Example usage of inference function:
# new_image_path = "path/to/your/new/image.png"
# best_model = mlflow.pytorch.load_model("runs:/<run_id>/model")
# prediction = predict_image(best_model, new_image_path, device)
# print(f"Predicted digit: {prediction}")
