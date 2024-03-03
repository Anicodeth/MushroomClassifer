data = mushroomcsv;


features = [double(data.capshape), double(data.capsurface), double(data.capcolor), double(data.habitat)];

target = data.class;

cv = cvpartition(size(features, 1),"HoldOut", 0.3);

X_train = features(training(cv),:);
Y_train = target(training(cv),:);
X_test = features(test(cv),:);
Y_test = target(test(cv),:);

MushroomModel = fitcknn(X_train, Y_train,"NumNeighbors", 3);

prediction = predict(MushroomModel, X_test);

correct = 0;
for i = 1 :size(prediction,1)
    if (prediction(i,1)==Y_test(i,1))
        correct = correct + 1;
    end
end
accuracy = correct / numel(Y_test);




