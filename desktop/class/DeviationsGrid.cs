using System.Collections.ObjectModel;

namespace desktop
{
    internal class DeviationsGrid
    {
        public static ObservableCollection<DeviationItem> ItemsSource { get; internal set; }
    }
}