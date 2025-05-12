
using scanner.Model.Enum;

namespace scanner.Controls
{
	public partial class ToggleControl : ContentView
	{
		// Selected option property
        public static readonly BindableProperty SelectedOptionProperty = BindableProperty.Create(nameof(SelectedOption), typeof(ListMode), typeof(ToggleControl),
                ListMode.Budget, propertyChanged: OnSelectedOptionChanged); 

        public ListMode SelectedOption
        {
            get => (ListMode)GetValue(SelectedOptionProperty);
            set => SetValue(SelectedOptionProperty, value);
        }

        // Event that fires when selection changes
        public event EventHandler<ListMode> SelectionChanged;

        // Colors for binding
        public Color ManageBackgroundColor => SelectedOption == ListMode.Budget ? Colors.White : Color.FromArgb("#007AFF");
        public Color ManageTextColor => SelectedOption == ListMode.Budget ? Color.FromArgb("#007AFF") : Colors.White;
        public Color BuyBackgroundColor => SelectedOption == ListMode.Buy ? Colors.White : Color.FromArgb("#007AFF");
        public Color BuyTextColor => SelectedOption == ListMode.Buy ? Color.FromArgb("#007AFF") : Colors.White;


        public ToggleControl ()
		{
			InitializeComponent();

            BindingContext = this;
            UpdateToggleAppearance();
        }

        private static void OnSelectedOptionChanged(BindableObject bindable, object oldValue, object newValue)
        {
            var control = (ToggleControl)bindable;
            control.UpdateToggleAppearance();
            control.SelectionChanged?.Invoke(control, control.SelectedOption);
        }

        private void UpdateToggleAppearance()
        {
            OnPropertyChanged(nameof(ManageBackgroundColor));
            OnPropertyChanged(nameof(ManageTextColor));
            OnPropertyChanged(nameof(BuyBackgroundColor));
            OnPropertyChanged(nameof(BuyTextColor));
        }

        private void OnManageClicked(object sender, EventArgs e)
        {
            SelectedOption = ListMode.Budget;
        }

        private void OnBuyClicked(object sender, EventArgs e)
        {
            SelectedOption = ListMode.Buy;
        }
    }
}