

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private EditText etAlcoholPrice;
    private EditText etGasPrice;
    private EditText etAlcoholConsumption;
    private EditText etGasConsumption;
    private Button btnCalculate;
    private TextView tvResult;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etAlcoholPrice = findViewById(R.id.etAlcoholPrice);
        etGasPrice = findViewById(R.id.etGasPrice);
        etAlcoholConsumption = findViewById(R.id.etAlcoholConsumption);
        etGasConsumption = findViewById(R.id.etGasConsumption);
        btnCalculate = findViewById(R.id.btnCalculate);
        tvResult = findViewById(R.id.tvResult);

        btnCalculate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                calculateFuel();
            }
        });
    }

    private void calculateFuel() {
        double alcoholPrice = Double.parseDouble(etAlcoholPrice.getText().toString());
        double gasPrice = Double.parseDouble(etGasPrice.getText().toString());
        double alcoholConsumption = Double.parseDouble(etAlcoholConsumption.getText().toString());
        double gasConsumption = Double.parseDouble(etGasConsumption.getText().toString());

        double alcoholCost = alcoholPrice / alcoholConsumption;
        double gasCost = gasPrice / gasConsumption;

        String result = "O melhor combustível para abastecer é ";
        if (alcoholCost < gasCost) {
            result += "álcool";
        } else {
            result += "gasolina";
        }

        tvResult.setText(result);
    }
}
